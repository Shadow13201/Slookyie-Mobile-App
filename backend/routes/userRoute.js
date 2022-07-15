const router=require("express").Router()
const userModel=require('../models/userModel');
const tokenModel=require('../models/tokenModel');
const userAuth=require('../middleware/userAuth')
var bcrypt=require('bcryptjs');
var jwt = require('jsonwebtoken');

//user registration
router.post('/reg/user',async(req,res)=>{
    try 
    {
        var{name,email,phonenumber,gender,city,password} =req.body;
        if(name==undefined || name==null)
        {
            res.status(200).json({
                status:false,
                msg:"Name not provided"
            })
        }
        if(phonenumber==null || phonenumber==undefined ){
            res.status(200).json({
                status: false,
                msg: "phone number not provided"
            });
            return;
        }
        if(email==null || email==undefined){
            res.status(200).json({
                status: false,
                msg: "email not provided"
            });
            return;
         }
    if(city==null || city ==undefined){
        res.status(200).json({
            status: false,
            msg: "city not provided"
        });
        return;
      }
      if(gender==null || gender ==undefined){
        res.status(200).json({
            status: false,
            msg: "gender not provided"
        });
        return;
    }
      if(password==null || password==undefined){
        res.status(200).json({
            status: false,
            msg: "Password not provided"
        });
        return;
      }
      var encryptedPassword=await bcrypt.hash(password,10);
      var data=new userModel({
        name : name,
        email:email,
        phonenumber:phonenumber,
        city:city,
        gender:gender,
        password:encryptedPassword,
        role:'user',
        status:'Active'
      })
      await data.save()
      var token = jwt.sign({
        id:data._id, 
        phonenumber:data.phonenumber},'shhh');

      var tokendata= new tokenModel({
          token:token,
          role:"user"
         
      })

      res.status(200).json({
          status:true,
          msg:"success",
          token:token,
          data:data
      })
      return;

    }
    catch (er)
    {
       console.log(er)
       res.status(500).json({
        status:false,
        msg:'Internal Server Error'
       })
       return;
    }
})

//user login 
router.post('/login/user',async(req,res)=>{
    try{
        var{email,password}=req.body;
        if(email==null || email==undefined)
        {
            res.status(200).json({
                status:false,
                msg:"Email required"
            })
            return;
        }
        if(password==null || password==undefined)
        {
            res.status(200).json({
                status:false,
                msg:"password required"
            })
            return
        }
        var data=await userModel.findOne({email:email,status:"Active"});
        if(!data){
            res.status(200).json({
                status:false,
                msg:"Invaid Email Address"
            })
            return
        }
        if(await bcrypt.compare(password, data.password))
        {
            var token = jwt.sign({
                id:data._id,
                email:data.email
            }, 'shhh');
            var tokendata=new tokenModel({
                token:token,
                role:"user"
            })
            await tokendata.save()
            res.status(200).json({
                status:true,
                msg:"Login Sucessfull",
                user:data,
                token:token
            });
            return;
        }
        else
        {
            res.status(200).json({
                status:false,
                msg:"wrong password"
            });
        }

    }
    catch(err){
        console.log(err)
        res.status(500).json({
            status:false,
            msg:"Internal Server Error"
        });
        return;
    }
})

//user logout
// router.get('/logout/user',userAuth,async(req,res)=>{
//     try{
//         var id=req.user.id;
//         if(id==null || id==undefined){
//             res.status(200).json({
//                 status:false,
//                 msg:"id not  provided"
//             })
//             return;
//         }
//        await tokenModel.deleteOne({tokenId:id})
//         res.status(200).json({
//             status:true,
//             msg:"Logged out"
//         });
//         return;
//     }
//     catch(er){
//         console.log(er)
//         res.status(500).json({
//             satus:false,
//             msg:"Internal server error"
//         })
//         return; 
//     }
// })



module.exports = router;