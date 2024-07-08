const mongoose =require("mongoose");

let dataSchema = new mongoose.Schema({
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
        type:String,

    },
    'description':{
        required: true,
        type:String,

    }
    });

module.exports=mongoose.model("ProductData",dataSchema)