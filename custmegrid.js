/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


 
Ext.Student=function(config){
    Ext.Student.superclass.constructor.call(this,config);
};

Ext.extend(Ext.Student,Ext.Window,
{
    height : 500,
    width : 400,
    scope : this,
    title : 'Enter marks',

    initComponent:
    /*"Emp_Id":"fmarathi",
        "Emp_marathi":"lmarathi",
        "Emp_hindiation":"company",
        "Emp_English":"email"*/
    function(config){
    
        this.Id=new Ext.form.NumberField({
            fieldLabel: '<b><h1 align =center>Roll No : </h1></b>',
            labelSeparator: '',
          
          
            allowBlank : false
             
        });           
        this.marathi=new Ext.form.NumberField({
            fieldLabel: '<b><h1 align =center>Marathi : </h1></b>',
            labelSeparator: '',
            allowBlank : false
            
        });
        this.hindi=new Ext.form.NumberField({
            fieldLabel: '<b><h1 align =center>Hindi : </h1></b>',
            labelSeparator: '',
            allowBlank : false
            
        });
        this.english=new Ext.form.NumberField({
            fieldLabel: '<b><h1 align =center>English : </h1></b>',
            labelSeparator: '',
            allowBlank : false
             
        }); 
            this.form2=new Ext.form.FormPanel({
            //  scope : this,
              
            //  renderTo: this,
            items :  [ this.Id,this.marathi,this.hindi,this.english ],
            buttons : [{
                     
                text : 'submit',
                scope : this,
                handler : 
                   
                   
                function(){
                   
                    var m=this.marathi.getValue();
                    var h=this.hindi.getValue();
                    var e=this.english.getValue();
                    if(btnc=='updt1')
                    {
                        var select= grid1.getSelectionModel().getSelected();  
                        Ext.Ajax.request({///used for Updating grid one the selected record with given id fro record
                            url: 'process1.jsp?command=5',
                            params: { 
                                "t":select.get('RollNo'),
                                "t1":this.rollno.getValue(),
                                "t2":m,
                                "t3":h,
                                "t4":e
                                
                            },
                            success:function()
                            {
                                Ext.Msg.alert('Status', 'Updated Successfully', function(btn, text){
                                    if (btn == 'ok'){
                                            
                                        this.grid1.store.load();
                                             
                                    // window.location = 'arrayreader.jsp'
                                    }
                                });
                    
                  
                            },
                            failure:function()
                            {
                                Ext.Msg.alert('failure');
                            } 
               
                        });
                             
                        select.beginEdit();
                        select.set('RollNo',this.rollno.getValue());
                        select.set('Marathi',this.marathi.getValue());
                        select.set('Hindi',this.hindi.getValue());
                        select.set('English',this.english.getValue());
                        select.endEdit();
                        this.close();
                        Ext.Msg.alert('Record Updated');
                      
                    }
                     
                     
                           
                    if(btnc=='grid1')////insertion operation in grid 1
                    {
                        var temp = Ext.data.Record.create([
                            'RollNo' ,'Marathi','Hindi','English' 
                            ]);
                        
                           
                             
                        grid1.getStore().insert(
                            grid1.getStore().getCount(),new temp({
                                RollNo   : this.Id.getValue(),
                                Marathi :m,
                                Hindi :h,
                                English :e
                                     
                                                     
                            }));
                        Ext.Ajax.request({
                            url: 'process1.jsp?command=2 ',
                            params: { 
                                "t1":this.Id.getValue(),
                                "t2":m,
                                "t3":h,
                                "t4":e///used for deleting the selected record with given id fro record
                            },
                            success:function()
                            {
                                Ext.Msg.alert('Status', 'Inserted Successful!y', function(btn, text){
                                    if (btn == 'ok'){
                                            
                                        this.grid1.store.load();
                                           
                                    // window.location = 'arrayreader.jsp'
                                    }
                                });
                    
                  
                            },
                            failure:function()
                            {
                                Ext.Msg.alert('failure');
                            } 
               
                        });
                                                
                        this.hide();
                    }
                    if(btnc=='grid2') {
                        var temp1 = Ext.data.Record.create([
                            'RollNo' ,'Marathi','Hindi','English' 
                            ]);
                        
                           
                             
                        grid2.getStore().insert(
                            grid2.getStore().getCount(),new temp1({
                                RollNo   : this.Id.getValue(),
                                Marathi :m,
                                Hindi :h,
                                English :e
                                     
                                                     
                            }));
                        Ext.Ajax.request({
                            url: 'process1.jsp?command=2',
                            params: { 
                                "t1":this.Id.getValue(),
                                "t2":m,
                                "t3":h,
                                "t4":e///used for deleting the selected record with given id fro record
                            },
                            success:function()
                            {
                                Ext.Msg.alert('Status', 'Inserted Successful!y ', function(btn, text){
                                    if (btn == 'ok'){
                                            
                                        this.grid2.store.load();
                                        this.store2.load();
                                           
                                    // window.location = 'arrayreader.jsp'
                                    }
                                });
                    
                  
                            },
                            failure:function()
                            {
                                Ext.Msg.alert('failure');
                            } 
               
                        });
                                                
                        this.hide();
                    }
 
                }
 
            }]
       
        });
        
        
        
 
  
        this.layout='form2',
        
        this.items=
        [
        this.form2 
        ]
        
        this.form1=new Ext.form.FormPanel({
            //  scope : this,
              
            //  renderTo: this,
            items :  [ this.Id,this.marathi,this.hindi,this.english ],
            buttons : [{
                     
                text : 'submit',
                scope : this,
                handler : 
                   
                   
                function(){
                    var check=grid1.getStore().find('Rollno',this.Id.getValue()); 
                    
                    // we can use getCmp('grid1') also
                    if(check==-1)
                    {  
                        if (this.form1.getForm().isValid())
                        {
                            var temp = Ext.data.Record.create([
                                'RollNo' ,'Marathi','Hindi','English' 
                                ]);
                            var m=this.marathi.getValue();
                            var h=this.hindi.getValue();
                            var e=this.english.getValue();
                           
                           
                             
                            grid1.getStore().insert(
                                grid1.getStore().getCount(),new temp({
                                    RollNo: this.Id.getValue(),
                                    Marathi :m,
                                    Hindi :h,
                                    English :e
                                     
                                                     
                                }));
                                    Ext.Ajax.request({
                            url: 'process1.jsp?command=0',
                            params: { 
                                "RollNo":this.Id.getValue(),
                                "Marathi":m,
                                "Hindi":h,
                                "English":e///used for deleting the selected record with given id fro record
                            },
                            success:function()
                            {
                                Ext.Msg.alert('Status', 'Inserted Successful!y', function(btn, text){
                                    if (btn == 'ok'){
                                            
                                       grid1.store.load();
                                             
                                  
                                    }
                                });
                    
                  
                            },
                            failure:function()
                            {
                                Ext.Msg.alert('failure');
                            } 
               
                        });                
                            this.hide();
                        }
                     
                        else{
                            Ext.Msg.show({
                                title: 'error',
                                msg: 'invalid entries',
                                buttons: {
                                    ok: true
                                } 

                            });
                        }
                    }
                    else
                    {
                        Ext.Msg.show({
                            title: 'error',
                            msg: 'duplicate value',
                            buttons: {
                                ok: true
                            } 

                        });
                    }
                  
                  
 
                }
 
            }]
       
        });
        
        
        
 
  
        this.layout='form',
        
        this.items=
        [
        this.form1 
        ]
        
 
        Ext.Student.superclass.initComponent.call(this,config);
 
    },
    onRender:function(config){
        Ext.Student.superclass.onRender.call(this,config);
   
    },
    
    display : function(){
 
     
        this.select=grid1.getSelectionModel().getSelected();
        
        this.marathi=this.select.data.Marathi;
        this.hindi=this.select.data.Hindi;
        this.english=this.select.data.English;
        this.rollno=this.select.data.RollNo;
       w = new Ext.Window({
            scope :this,
            height : 400,
            width : 300,
            //  layout:'form',
            title : '<b><h1 align=center>Result</h1></b>',
        
            html : '<h><font color="red"><h1>This Is A Secteted RollNo Result</font><br><b>Roll No =  '+this.rollno+'<br>'+ 
            '<br><font color="blue"><h1><i> Marathi = </font> [ '+this.marathi+' ]<br>'+
            '<br><font color="blue"><h1><i> Hindi = </font>[ '+this.hindi+' ]<br>'+
              '<br><font color="blue"><h1><i> English = </font> [ '+this.english+' ]<br>',
           buttons: [
                {
                            text : 'Cancle',
                            scope : this,
                            handler : 
                                function(){
                              
                               w.close();
                            }
                        },
           ]  
      
        })
        w.show();

    },
    
    display1 : function(){
 
     
        this.select=grid2.getSelectionModel().getSelected();
        this.marathi=this.select.data.Marathi;
        this.hindi=this.select.data.Hindi;
        this.english=this.select.data.English;
        this.rollno=this.select.data.RollNo;
       w1= new Ext.Window({
            scope :this,
            height : 400,
            width : 300,
            //  layout:'form',
            title : '<b><h1 align=center>Result</h1></b>',
        
            html : '<h><font color="red"><h1>This Is A Secteted RollNo Result</font><br><b>Roll No =  '+this.rollno+'<br>'+ 
            '<br><font color="blue"><h1><i> Marathi = </font> [ '+this.marathi+' ]<br>'+
            '<br><font color="blue"><h1><i> Hindi = </font>[ '+this.hindi+' ]<br>'+
              '<br><font color="blue"><h1><i> English = </font> [ '+this.english+' ]<br>',
          
           buttons: [
                {
                            text : 'Cancle',
                            scope : this,
                            handler : 
                                function(){
                              
                               w1.close();
                            }
                        },
           ]
         

        });
        w1.show();

    }
    
    
});
