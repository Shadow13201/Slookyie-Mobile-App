const router=require("express").Router()
const userModel=require('../models/userModel');
const tokenModel=require('../models/tokenModel');
const serviceModel=require('../models/serviceModel')
const userAuth=require('../middleware/userAuth')
const adminAuth=require('../middleware/adminAuth')
var bcrypt=require('bcryptjs');
var jwt = require('jsonwebtoken');

//ADD Service
router.post('/addService/admin',adminAuth,async(req,res)=>{
    try 
    {
        var{service}=req.body;
        if(service==null || service== undefined)
        {
            res.status(200).json({
                status:false,
                msg:'Enter Service'
            });
            return;
        }

        var d= new serviceModel({
            service:service
        })
        await d.save()

        res.status(200).json({
            status:true,
            msg:'Service Added'
        })
        return;
    } 
    catch (err) 
    {
       console.log(err);
       res.status(500).json({
        status:false,
        msg:'Internal Server Error'
       }) 
       return;
    }
})

//View all Services
router.get('/view/services',async(req,res)=>{
    try 
    {
        var {id}=req.user.id
    } 
    catch (err) 
    {
        
    }
})
