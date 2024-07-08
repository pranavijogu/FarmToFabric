const express = require("express");
const mongoose = require("mongoose");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

process.on('unhandledRejection', (reason, promise) => {
  console.log('Unhandled Rejection at:', promise, 'reason:', reason);
});

mongoose.connect("mongodb+srv://FTF:farmtofabric@ftf.1rnx80m.mongodb.net/FTF")
  .then(() => console.log('DB meeku vanakkam cheptundi'))
  .catch(err => console.error('Failed to connect to MongoDB', err));


const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const woolSchema = new mongoose.Schema({

  'sheepbreed1':{
    required:true,
    type:String
  },
  'disease':{
    required:true,
    type:String
  },
  'output':
  {
    required:true,
    type:String
},
  'prodisc':{
    required:true,
    type:String

  },
  'colour1':{
    required:true,
    type:String

  },
  'weight1':{
    required:true,
    type:Number
  },
  'price1':{
    required:true,
    type:Number
  },
  'images':{
    type:String,
    required:true,
  }

});


const productSchema = new mongoose.Schema({
    'sheep_breed':{
        required: true,
        type:String,

    },
    'colour':{
        required: true,
        type:String,

    },
    'weight':{
        required: true,
        type:String,

    },
    'price':{
        required: true,
        type:Number,

    },
    'description':{
        required: true,
        type:String,

    },
    'images':{
      type:String,
      required:true,
    }
    });


const authSchema = new mongoose.Schema({
    name: {
        required: true,
        type: String,
    },
    number: {
        required: true,
        type: Number,
        unique: true,
    },
    email: {
        required: true,
        type: String,
        unique: true,
    },
    password: {
        required: true,
        type: String,
    },
    confirmpassword: { 
        required: true,
        type: String,
        validate: {
            validator: function (value) {
                return value === this.password;
            },
            message: "Passwords do not match",
        },
    },
    address:
    {
        required:true,
        type:String,

    },
    industry:{
        required:false,
        type:String

    },
    services:{
        required:false,
        type:String
    }

});


  

const Product = mongoose.model("Product", productSchema);
const UserActivation = mongoose.model("UserActivation", authSchema);
const rawwool = mongoose.model("rawwool",woolSchema);


app.post("/api/addwool", async (req, res) => {
  let data = new rawwool(req.body);
  try {
    let ds = await data.save();
    res.status(200).json(ds);
  } catch (error) {
    res.status(400).json({
      status: error.message,
    });
  }
});

//Get wool
app.get("/api/getwool", async (req, res) => {
  try {
    let data = await rawwool.find();
    res.status(200).json(data);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});

app.post("/api/delwool/:id", (req, res) => {
  let id = req.params.id * 1;
  rawwool.deleteOne({ _id: id }, (err, result) => {
    if (err) {
      res.status(500).json({
        error: err.message,
      });
    } else {
      res.status(204).send({
        status: "success",
        message: "Product Deleted",
      });
    }
  });
});


// Your Product endpoints here
app.post("/api/addprod", async (req, res) => {
  let data = new Product(req.body);
  try {
    let ds = await data.save();
    res.status(200).json(ds);
  } catch (error) {
    res.status(400).json({
      status: error.message,
    });
  }
});

app.get("/api/getprod", async (req, res) => {
  try {
    let data = await Product.find();
    res.status(200).json(data);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});

app.post("/api/delprod/:id", (req, res) => {
  let id = req.params.id * 1;
  Product.deleteOne({ _id: id }, (err, result) => {
    if (err) {
      res.status(500).json({
        error: err.message,
      });
    } else {
      res.status(204).send({
        status: "success",
        message: "Product Deleted",
      });
    }
  });
});

// Your Auth endpoints here
app.post("/api/signup", async (req, res) => {
  try {
    const { name, number, email, password, confirmpassword, address, industry, services } = req.body;

    if (!password) {
      return res.status(400).json({ error: 'Password is required' });
    }

    if (typeof password !== 'string' || password.trim() === '') {
      return res.status(400).json({ error: 'Invalid password format' });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const existingUser = await UserActivation.findOne({ number });
    if (existingUser) {
      return res.status(400).json({ msg: "User with the same mobile number already exists" });
    }

    const existingUser1 = await UserActivation.findOne({ email });
    if (existingUser1) {
      return res.status(400).json({ msg: "User with the same email already exists" });
    }

    let user = new UserActivation({
      name,
      number,
      email,
      password: hashedPassword,
      confirmpassword: hashedPassword,
      address,
      industry,
      services,
    });

    user = await user.save();

    res.json(user);
  }  catch (e) {
    console.error("Error message:", e.message);
    console.error("Stack trace:", e.stack);

    res.status(500).json({ error: e.message });
  }
});

app.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await UserActivation.findOne({ email });
    if (!user) {
      return res.status(400).json({ msg: "User with this email does not exist" });
    }

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect password" });
    }

    const token = jwt.sign({ id: user._id }, "your_secret_key_here");

    // Store the generated user ID in the global variable
    userId = user._id;

    res.json({ token, user });
  } catch (e) {
      console.error(e);
      res.status(500).json({ error: e.message });
  }
});



    


  
  app.get("/api/services", async (req, res) => {
    try {
      const usersWithServices = await UserActivation.find({ services: { $ne: "" } });
  
      if (usersWithServices.length === 0) {
        return res.status(400).json({ error: "No users found with services" });
      }
  
      const userData = usersWithServices.map(user => ({
        name: user.name,
        number: user.number,
        address: user.address,
        services: user.services
      }));
  
      res.json({
        users: userData
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: "Internal Server Error" });
    }
  });

  app.get("/api/profile", async (req, res) => {
    try {
      // Use the global user ID variable to fetch user details
      const user = await UserActivation.findById(userId);
  
      if (!user) {
        return res.status(404).json({ error: "User not found" });
      }
  
      const userData = {
        name: user.name,
        number: user.number,
        address: user.address,
        services: user.services
      };
  
      res.json({ user: userData });
    } catch (e) {
      console.error(e);
      res.status(500).json({ error: e.message });
    }
  });
  
  
app.listen(3000, () => {
  console.log(`Server Listening on Port http://localhost:${3000}`);
});