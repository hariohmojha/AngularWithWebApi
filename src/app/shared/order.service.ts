import { Injectable } from '@angular/core';
import { OrderItems } from './order-items.model';
import { Order } from './order.model';

@Injectable({
  providedIn: 'root'
})
export class OrderService {
  
  formData:Order
orderItems:OrderItems[];

  constructor() { }
}
