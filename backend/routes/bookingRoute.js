const router=require("express").Router()
const userModel=require('../models/userModel');
const tokenModel=require('../models/tokenModel');
const serviceModel=require('../models/serviceModel');
const bookingModel=require('../models/bookingModel');
const userAuth=require('../middleware/userAuth')
const adminAuth=require('../middleware/adminAuth')
var bcrypt=require('bcryptjs');
var jwt = require('jsonwebtoken');

//Book services
router.post('/book/services',userAuth,async(req,res)=>{
    try 
    {
     var{serviceId,date,time }=req.body;
     var id=req.user.id;
     console.log(id)
     if(serviceId==null || serviceId==undefined)
     {
        res.status(200).json({
            status:false,
            msg:"service id required"
        });
        return;
     }  
     if(date==null || date==undefined)
     {
        res.status(200).json({
            status:false,
            msg:"Date not provided"
        });
        return;
     }  
     if(time==null || time==undefined)
     {
        res.status(200).json({
            status:false,
            msg:"Time not provided"
        });
        return;
     } 
     var task=await serviceModel.findOne({_id:serviceId})
     if(task==null || task==undefined)
     {
        res.status(200).json({
            status:false,
            msg:"Data not found"
        });
        return;
     } 
     var data=new bookingModel()
     data.serviceId=serviceId
     data.date=date
     data.time.start=time.start
     data.time.end=time.end
     await data.save()

     res.status(200).json({
        status:true,
        msg:"Booking successfull",
        data:data
     });
     return;
    } 
    catch (error) 
    {
        console.log(error)
        res.status(500).json({
            status:false,
            msg:"Internal Server Error"
         });
         return;   
    }
})

//view booking
// router.get('/viewBooking/admin',adminAuth,async(req,res)=>
// {
//     try 
//     {
        
//     } 
//     catch (error) 
//     {
//         console.log(error)
//         res.status(500).json({
//             status:false,
//             msg:"Internal Server Error"
//          });
//          return;   
//     }
// })

module.exports=router;