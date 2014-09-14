<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="lib/resources/css/wtf-all.css"/>
        <script type="text/javascript" src="lib/adapter/wtf/wtf-base.js"></script>
        <script type="text/javascript" src="lib/wtf-core-debug.js"></script>
        <script type="text/javascript" src="lib/wtf-core.js"></script>
        <script type="text/javascript" src="lib/wtf-all-debug.js"></script>
        <script type="text/javascript" src="form2.js"></script>
        <script type="text/javascript" src="gridscustome.js"></script>
        <script type="text/javascript" src="customeView.js"></script>

        <script type="text/javascript">
            
            Wtf.onReady(function(){
                
                   
                function update(btnc)
                {
               
                    this.rollno1=new Wtf.form.TextField({
                
                        fieldLabel: '<b><h1 align =center>Roll No</h1></b>',
                        labelSeparator: '',
         
         
                        allowBlank : false
            
                    });          
                    this.marathi1=new Wtf.form.TextField({
                        fieldLabel: '<b><h1 align =center>Marathi</h1></b>',
                        labelSeparator: '',
                        allowBlank : false
           
                    });
                    this.hindi1=new Wtf.form.TextField({
                        fieldLabel: '<b><h1 align =center>Hindi</h1></b>',
                        labelSeparator: '',
                        allowBlank : false
           
                    });
                    this.english1=new Wtf.form.TextField({
                        fieldLabel: '<b><h1 align =center>English</h1></b>',
                        labelSeparator: '',
                        allowBlank : false
            
                    });
               
               
                    this.win1=new Wtf.Window({
                        layout:'form',
                        title:'Update details for selected',
                        items:[  new Wtf.form.FormPanel({
                                //  scope : this,
             
                                //  renderTo: this,
                                items :  [ this.marathi1,this.hindi1,this.english1 ],
                                buttons : [{
                                        text : 'Update',
                                        scope :this,
                                        
                                        iconCls:'update',
                                        handler:                      
                                            function(){
                                            var t=this.rollno1.getValue();
                                            var m=this.marathi1.getValue();
                                            var h=this.hindi1.getValue();
                                            var e=this.english1.getValue();
                                            if(btnc=='updt1')
                                            {
                                                var select= grid1.getSelectionModel().getSelected();  
                                                Wtf.Ajax.request({///used for Updating grid one the selected record with given id fro record
                                                    url: 'process1.jsp?command=5',
                                                    params: { 
                                                        "t":select.get('RollNo'),
                                                        "t1":this.rollno1.getValue(),
                                                        "t2":m,
                                                        "t3":h,
                                                        "t4":e
                                
                                                    },
                                                    success:function()
                                                    {
                                                        Wtf.Msg.alert('Status', 'Updated Successfully', function(btn, text){
                                                            if (btn == 'ok'){
                                            
                                                                this.grid1.store.load();
                                                                this.win1.hide();       
                                                                // window.location = 'arrayreader.jsp'
                                                            }
                                                        });
                    
                  
                                                    },
                                                    failure:function()
                                                    {
                                                        Wtf.Msg.alert('failure');
                                                    } 
               
                                                });
                             
                                                select.beginEdit();
                                                select.set('RollNo',this.rollno.getValue());
                                                select.set('Marathi',this.marathi.getValue());
                                                select.set('Hindi',this.hindi.getValue());
                                                select.set('English',this.english.getValue());
                                                select.endEdit();
                                                this.close();
                                                Wtf.Msg.alert('Record Updated');
                                                this.hide();
                                            }
                     
                                            if(btnc=='updt2')
                                            {
                                                var select= grid2.getSelectionModel().getSelected();  
                                                Wtf.Ajax.request({///used for Updating grid one the selected record with given id fro record
                                                    url: 'process1.jsp?command=5',
                                                    params: { 
                                                        "t":select.get('RollNo'),
                                                        "t1":this.rollno1.getValue(),
                                                        "t2":m,
                                                        "t3":h,
                                                        "t4":e
                                
                                                    },
                                                    success:function()
                                                    {
                                                        Wtf.Msg.alert('Status', 'Updated Successfully', function(btn, text){
                                                            if (btn == 'ok'){
                                            
                                                                this.grid2.store.load();
                                                                this.win1.hide();       
                                                                // window.location = 'arrayreader.jsp'
                                                            }
                                                        });
                    
                  
                                                    },
                                                    failure:function()
                                                    {
                                                        Wtf.Msg.alert('failure');
                                                    } 
               
                                                });
                             
                                                select.beginEdit();
                                                select.set('RollNo',this.rollno.getValue());
                                                select.set('Marathi',this.marathi.getValue());
                                                select.set('Hindi',this.hindi.getValue());
                                                select.set('English',this.english.getValue());
                                                select.endEdit();
                                                this.close();
                                                Wtf.Msg.alert('Record Updated');
                                                this.hide();
                                            }
                           
                                            if(btnc=='grid1')////insertion operation in grid 1
                                            {
                                                var temp = Wtf.data.Record.create([
                                                    'RollNo' ,'Marathi','Hindi','English' 
                                                ]);
                        
                           
                             
                                                grid1.getStore().insert(
                                                grid1.getStore().getCount(),new temp({
                                                    RollNo   : this.Id.getValue(),
                                                    Marathi :m,
                                                    Hindi :h,
                                                    English :e
                                     
                                                     
                                                }));
                                                Wtf.Ajax.request({
                                                    url: 'process1.jsp?command=2 ',
                                                    params: { 
                                                        "t1":this.Id.getValue(),
                                                        "t2":m,
                                                        "t3":h,
                                                        "t4":e///used for deleting the selected record with given id fro record
                                                    },
                                                    success:function()
                                                    {
                                                        Wtf.Msg.alert('Status', 'Inserted Successful!y', function(btn, text){
                                                            if (btn == 'ok'){
                                            
                                                                this.grid1.store.load();
                                             
                                                                // window.location = 'arrayreader.jsp'
                                                            }
                                                        });
                    
                  
                                                    },
                                                    failure:function()
                                                    {
                                                        Wtf.Msg.alert('failure');
                                                    } 
               
                                                });
                                                
                                                this.hide();
                                            }
                                            if(btnc=='grid2'){
                                                var temp1 = Wtf.data.Record.create([
                                                    'RollNo' ,'Marathi','Hindi','English' 
                                                ]);
                        
                           
                             
                                                grid2.getStore().insert(
                                                grid2.getStore().getCount(),new temp1({
                                                    RollNo   : this.Id.getValue(),
                                                    Marathi :m,
                                                    Hindi :h,
                                                    English :e
                                     
                                                     
                                                }));
                                                Wtf.Ajax.request({
                                                    url: 'process1.jsp?command=2',
                                                    params: { 
                                                        "t1":this.Id.getValue(),
                                                        "t2":m,
                                                        "t3":h,
                                                        "t4":e///used for deleting the selected record with given id fro record
                                                    },
                                                    success:function()
                                                    {
                                                        Wtf.Msg.alert('Status', 'Inserted Successful!y ', function(btn, text){
                                                            if (btn == 'ok'){
                                            
                                                                this.grid2.store.load();
                                                                this.store2.load();
                                           
                                                                // window.location = 'arrayreader.jsp'
                                                            }
                                                        });
                    
                  
                                                    },
                                                    failure:function()
                                                    {
                                                        Wtf.Msg.alert('failure');
                                                    } 
               
                                                });
                                                
                                                this.hide();
                                            }
 
                                        }
                                    },]
      
                            })
                       
                        ]
                   
                    });
                    this.win1.show();
              
                }
                
                this.store2=new Wtf.data.Store({    //create store 
                    url:'process1.jsp?command=1',
                    reader: new Wtf.data.JsonReader({ 
                        root:'rows',
                        id:'RollNo'
         
                    },
                    ['RollNo',
                        'Marathi',
                        'Hindi',
                        'English'
                    ]
                )
           
        
                });
                
  
                this.store2.load();//load store
                this.sm = new Wtf.grid.CheckboxSelectionModel();
 
                this.grid1 = new Wtf.customgrid({
                    store:  store2,
                    frame:true, 
                    width:500,
                    height:400,
                    id:'grid1',
                    scope:this,
                    multiSelect:true,//to select one at a time
                    cls:'grids',
                    title:'Student mark database',
                    cm: new Wtf.grid.ColumnModel([
                        sm,
                            
                        {
                            header : '<p style="color:black;font-size: 15px;">Id ', 
                            dataIndex :'RollNo',
                            sortable : true,
                            width : 70 
                        },
                        {
                            header : '<p style="color:black;font-size: 15px;">Marathi', 
                            dataIndex :'Marathi',
                            width : 70 
                        },
                        {
                            header : '<p style="color:black;font-size: 15px;">Loaction', 
                            dataIndex :'Hindi',
                            width : 80
                        } ,
                        {
                            header : '<p style="color:black;font-size: 15px;">English<p>', 
                            dataIndex :'English',
                            width : 70
                        } 
                    ]) ,
                    sm:sm,
  
                    buttons : 
                        [
                        {
                            text : 'add',
                            scope :this,
                            iconCls:'add',
                            handler:
                                function(){
                                
                                //    flag=true;
                                this.w= new Wtf.Student({    //call to custome component over here
                                    scope: this,  
                                    width:300,
                                    height:500,
                                    layout:'form',
                                    items:[{
                                            xtype:'textfield',
                                            fieldLabel:'add'
                                        }]
                                    
                                     
                                });
                                this.w.show();
                            }
                        } ,
                        {
                            text : 'delete',
                            iconCls:'remove' ,
                              
                            scope : this,
                            handler : 
                                function(){
                                var i;
                                
                                var select =this.grid1.getSelectionModel().getSelections();
                                for (i=0;i< select.length;i++) {
                                    this.grid1.store.remove(select[i]);
                                    Wtf.Ajax.request({
                                        url: 'process1.jsp?command=3',
                                        params: { 
                                            "rollno": select[i].get('RollNo')              ///used for deleting the selected record with given id fro record
                                        },
                                        success:function()
                                        {
                                            Wtf.Msg.alert('Status', 'Deleted Successful!y', function(btn, text){
                                                if (btn == 'ok'){
                                            
                                                    this.grid1.store.load();
                                             
                                                    // window.location = 'arrayreader.jsp'
                                                }
                                            });
                  
                                        },
                                        failure:function()
                                        {
                                            Wtf.Msg.alert('failure');
                                        } 
               
                                    });
                                    
                                }
                            }
                        },
                      
                        {
                            text : 'show',
                            scope : this,
                            handler : 
                                function(){
                                //    flag=false;
                                this.w= new Wtf.Student({
                                    scope : this
                                });
                                this.w.display();
                            }
                        },
                        
                        {
                            text : 'Update',
                            scope :this,
                            iconCls:'update',
                            handler:
                                function(){
                            
                                this.select1=grid1.getSelectionModel().getSelections();
                   
                                if(select1.length  < 1)
                                {
                                    Wtf.Msg.alert('No records','Select Record First');
                                }
                                else{
                                    //call 
                                  
                                    //Set the previous values to textfield before update
                                    
                                    update('updt1');
                                    
                                    
                                       
                                }//    flag=true;
                                 
                            }
                        },
                    ]
                });
                 
                 
           
                this.store3=new Wtf.data.Store({    //create store 
                    url:'process1.jsp?command=1',
                    reader: new Wtf.data.JsonReader({ 
                        root:'rows',
                        id:'RollNo'
         
                    },
                    ['RollNo',
                        'Marathi',
                        'Hindi',
                        'English'
                    ]
                )
           
        
                });
                this.store3.load();
           
          
           
                this.sm2 = new Wtf.grid.CheckboxSelectionModel();
 
                this.grid2 = new Wtf.customgrid({
                    store:store3,
                    frame:true, 
                    width:500,
                    height:200,
                    frame:true, 
                    width:500,
                    height:400,
                    id:'grid2',
                    scope:this,
                    multiSelect:true,
                    // multiSelect:false,//to select one at a time
                    cls:'grids',
                    sm:   this.sm2,
                    title:'Studemt Mark database',
                    cm: new Wtf.grid.ColumnModel([
                        this.sm2,
                            
                        {
                            header : '<p style="color:black;font-size: 15px;">Id ', 
                            dataIndex :'RollNo',
                            sortable : true,
                            width : 70 
                        },
                        {
                            header : '<p style="color:black;font-size: 15px;">marathi', 
                            dataIndex :'Marathi',
                            width : 70 
                        },
                        {
                            header : '<p style="color:black;font-size: 15px;">Loaction', 
                            dataIndex :'Hindi',
                            width : 80
                        } ,
                        {
                            header : '<p style="color:black;font-size: 15px;">English<p>', 
                            dataIndex :'English',
                            width : 70
                        } 
                    ]) ,  
  
                    buttons : 
                        [
                        {
                            text : 'add',
                            scope :this,
                            iconCls:'add',
                            handler:
                                function(){
                                
                                //    flag=true;
                                this.w= new Wtf.Student({    //call to custome component over here
                                    scope: this,  
                                    width:300,
                                    height:500,
                                    layout:'form',
                                    items:[{
                                            xtype:'textfield',
                                            fieldLabel:'add'
                                        }]
                                    
                                     
                                });
                                this.w.show();
                            }
                        } ,
                        {
                            text : 'delete',
                            iconCls:'remove' ,
                              
                            scope : this,
                            handler : 
                                function(){
                                var i;
                                
                                var select =this.grid2.getSelectionModel().getSelections();
                                for (i=0;i< select.length;i++) {
                                    this.grid2.store.remove(select[i]);
                                    Wtf.Ajax.request({
                                        url: 'process1.jsp?command=3',
                                        params: { 
                                            "rollno": select[i].get('RollNo')              ///used for deleting the selected record with given id fro record
                                        },
                                        success:function()
                                        {
                                            Wtf.Msg.alert('Status', 'Deleted Successful!y', function(btn, text){
                                                if (btn == 'ok'){
                                            
                                                    this.grid1.store.load();
                                             
                                                    // window.location = 'arrayreader.jsp'
                                                }
                                            });
                  
                                        },
                                        failure:function()
                                        {
                                            Wtf.Msg.alert('failure');
                                        } 
               
                                    });
                                    
                                }
                            }
                        },
                        {
                            text : 'show',
                            scope : this,
                            handler : 
                                function(){
                                //    flag=false;
                                this.w= new Wtf.Student({
                                    scope : this
                                });
                                this.w.display1();
                            }
                        },
                        {
                            text : 'Update',
                            scope :this,
                            iconCls:'update',
                            handler:
                                function(){
                            
                                this.select2=grid2.getSelectionModel().getSelections();
                   
                                if(select2.length  < 1)
                                {
                                    Wtf.Msg.alert('No records','Select Record First');
                                }
                                else{
                                    //call 
                                  
                                    //Set the previous values to textfield before update
                                    
                                    update('updt2');
                                    
                                    
                                       
                                }//    flag=true;
                                 
                            }
                        },
                    ]
                });
                ///the movement code here
                this.mright=new Wtf.Button({
                    text:'------------------------Move  Data Right------->>-----------',
                    scope:this,
                    handler:function(){
                        
                        var temp = Wtf.data.Record.create([
                            'RollNo',
                            'Marathi',
                            'Hindi',
                            'English'
                        ]);
                        this.select=grid1.getSelectionModel().getSelected();
                        this.Id=this.select.data.RollNo;
                        this.marathi=this.select.data.Marathi;
                        this.hindi=this.select.data.Hindi;
                        this.english=this.select.data.English;
                             
                        this.grid2.getStore().insert(
                        this.grid2.getStore().getCount(),new temp({
                            RollNo:this.Id,
                            Marathi:this.marathi,
                            Hindi:this.hindi,
                            English:this.english
                                                     
                        }))
                                                
                        // store3.load();
                    }
                }
            );
           
                this.mleft=new Wtf.Button({
                    text:'----------------<<--------Move  Data Left------------------',
                    scope:this,
                    handler:function(){
                        
                        var temp = Wtf.data.Record.create([
                            'RollNo',
                            'Marathi',
                            'Hindi',
                            'English'
                        ]);
                        this.select=grid2.getSelectionModel().getSelected();
                        this.Id=this.select.data.RollNo;
                        this.marathi=this.select.data.Marathi;
                        this.hindi=this.select.data.Hindi;
                        this.english=this.select.data.English;
                             
                        this.grid1.getStore().insert(
                        this.grid1.getStore().getCount(),new temp({
                            RollNo:this.Id,
                            Marathi:this.marathi,
                            Hindi:this.hindi,
                            English:this.english
                                                     
                        }))
                                                
                        // store3.load();
                    }
                }
            );
            
                this.allright=new Wtf.Button({
                    text:'-------------------Move All Data Record Right----->>-------------',

                    width:300,
                    height:500,
                    layout:'form',
                    scope:this,
                    handler:function(){
                        var i=0;
                        var temp = Wtf.data.Record.create([
                            'RollNo',
                            'Marathi',
                            'Hindi',
                            'English'
                        ]);
                        this.select=grid1.getSelectionModel().getSelections();
                        
                        
                        for(i=0;i<this.select.length;i++)
                        {
                            this.Id=this.select[i].data.RollNo;
                            this.marathi=this.select[i].data.Marathi;
                            this.hindi=this.select[i].data.Hindi;
                            this.english=this.select[i].data.English;
                             
                            this.grid2.getStore().insert(
                            this.grid2.getStore().getCount(),new temp({
                                RollNo:this.Id,
                                Marathi:this.marathi,
                                Hindi:this.hindi,
                                English:this.english
                                                     
                            }
                        )
                    
                        )
                                                
                            // store3.load();
                              
                        }
                    }
                }
            );
           
           
                this.allleft=new Wtf.Button({
                    text:'-------------<<------Move All Data Record Left------------------>',
                    width:300,
                    hight:200,
                  
                    scope:this,
                    handler:function(){
                        var i=0;
                        var temp = Wtf.data.Record.create([
                            'RollNo',
                            'Marathi',
                            'Hindi',
                            'English'
                        ]);
                        this.select=grid2.getSelectionModel().getSelections();
                        
                        
                        for(i=0;i<this.select.length;i++)
                        {
                            this.Id=this.select[i].data.RollNo;
                            this.marathi=this.select[i].data.Marathi;
                            this.hindi=this.select[i].data.Hindi;
                            this.english=this.select[i].data.English;
                             
                            this.grid1.getStore().insert(
                            this.grid1.getStore().getCount(),new temp({
                                RollNo:this.Id,
                                Marathi:this.marathi,
                                Hindi:this.hindi,
                                English:this.english
                                                     
                            }
                        )
                    
                        )
                                                
                            // store3.load();
                              
                        }
                    }
                }
            );
           
           
                this.view=new Wtf.customview({
                    layout:'border',
                   
                    renderTo:document.body,
             
                    items:
                        [
                        {
                            region:'west',
                            title:'<p style="color:red; font-size:30">Grid1</p>',
                            width:500,
                            hight:200,
                      
                            collapsible:true,
                           
                            items : [this.grid1]
                        },
                        {
                            region:'center',
                          

                             
                            items:[
                                {
                                    xtype:'panel',
                                    html:'<div align="center" style="background-color:white" ><img src="index1.jpeg"></div>',
                                    title:'<p style="color:red; font-size:30">Move Mark record</p>',
                        
                                    items:[
                                        this.mright,
                                        this.mleft,
                                        this.allright,
                                        this.allleft
                                    ]
                                    
                                }
                            ]
                        },
                        {
                            region:'east',
                            title:'<p style="color:red; font-size:30">Grid2</p>',
                            width:510,
                            hight:200,
                            collapsible:true,
                            items : [this.grid2]
                        },
                        {
                            title: 'My Krawler Information Systems',
                            region: 'south',
                            height: 430,
                            minSize: 75,
                            maxSize: 250,
                            cmargins: '5 0 0 0',
                            html:'<h1><font color ="Red">Bipil Raut</font> </h1>'+
                                '<br>Krawler Information Systems Pvt. Ltd'+
                                '<br> Commerzone, Building No. 1,'+
                                ' <br>5th Floor, Office No. 503, Off Airport Road,'+
                                '<br>Samrat Ashok Path,'+
                                '<br>Yerwada, Pune 411006'+
                                '<br>India'+
                                '<br>Phone: +91 8446147160'+
                                '<br>Email: info@krawler.com'+
                                '<br><img border="" src="11.jpg" alt="Pulpit rock" width="304" height="228">'
                        },
                    ]
                    
                });
            });

        </script>
    </head>
    <style>
        .grids{
            color:#57104f;
        }
        #grid1 .x-grid3-cell-inner {
            font-size: 12px;
            font-style:normal;
            color: #8b226d;

        } 



        .remove{
            background-image: url(images/fileclose.png) !important;
        }

        .add {
            background-image: url(images/add_1.png) !important;
        }
        .update {
            background-image: url(images/update_1.png) !important;
        }
    </style>
</html>
