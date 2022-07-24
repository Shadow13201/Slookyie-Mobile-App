const mongoose = require("mongoose");
const schema = mongoose.Schema;
var SchemaTypes = mongoose.Schema.Types;


const bookingModelSchema = new mongoose.Schema({
    

});
module.exports = mongoose.model("bookingModel", bookingModelSchema);