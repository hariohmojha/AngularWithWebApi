import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';



import { OrderService } from 'src/app/shared/order.service';
import { OrderItemsComponent } from '../order-items/order-items.component';



@Component({
  selector: 'app-order',
  templateUrl: './order.component.html',
  styles: []
})
export class OrderComponent implements OnInit {


       
  constructor(public service:OrderService ,
    private dailog:MatDialog ) {
  
   }

  ngOnInit(): void {
    
   
    
    this.resetform();

  

  }

 

  resetform(form?:NgForm){
    if(form=null)
    form.resetForm();
    this.service.formData={
      OrderID: null,
      OrderNo:Math.floor(100000+Math.random()*900000).toString(),
      CustomerID:0,
      PMethod:'',
      GTotal:0

    }
    this.service.orderItems=[];

    

    }
    AddOrEditOrderItem(orderItemsIndex,OrderID){
      const dailogConfig=new MatDialogConfig();
      dailogConfig.autoFocus=true;
      dailogConfig.disableClose=true;
      dailogConfig.width="50%";
      dailogConfig.data={orderItemsIndex,OrderID};
      this.dailog.open(OrderItemsComponent,);
  }
}