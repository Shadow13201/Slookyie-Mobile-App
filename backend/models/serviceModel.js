const mongoose = require("mongoose");
const schema = mongoose.Schema;
var SchemaTypes = mongoose.Schema.Types;

const serviceModelScheme=new mongoose.schema
({
    serviceId:{
        type:String
    }
    
})