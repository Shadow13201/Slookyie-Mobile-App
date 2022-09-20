const mongoose = require("mongoose");
const schema = mongoose.Schema;
var SchemaTypes = mongoose.Schema.Types;

const slotModelScheme=new mongoose.Schema
({
    slotId:{
        type:String
    },
    
    slot:{
        type:String
    },
    role:{
        type:String,
        default:"slot"
    }
})
module.exports = mongoose.model("slotModel", slotModelScheme);