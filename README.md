##TableTurn

- TableTurn is a mobile-optimized restaurant management application with a particular focus on the facilitation of order generation by waitstaff.

---

<img src="images/TableTurn_Main.PNG" width="250px">

---

- Each server can select among their upcoming and open tables for the day.

---

<img src="images/TableTurn_Tables.PNG" width="250px">

---
- On the order page, food items are added to the tab by dropdown menu, and additional information about an item can be retrieved by clicking on it.

---

<img src="images/TableTurn_Order.PNG" width="250px">

---

- The checkout button will generate a receipt of all items, along with suggested tips. Clicking on a chosen tip will produce a final total. Exiting out of the receipt will close the order.

---

<img src="images/TableTurn_Receipt.PNG" width="250px">

---

- TableTurn also supports a variety of funcionality for administrative staff, which will be accessible only by login in subsequent versions.

---

<img src="images/TableTurn_Admin.PNG" width="250px">

---

- Functionality includes complete management of  waitstaff, menu and reservations, including creation, editing and deletion of all items.

---

<img src="images/TableTurn_Menu.PNG" width="250px">

---

- Reservations are booked by date and time, with unbooked tables marked with green, and booked tables marked with red

---

<img src="images/TableTurn_Reservations.PNG" width="250px">

---

- Kitchen staff can view orders as they come in, with colors indicating length of time since the order was placed (Desktop only)

---

![Image of TableTurn](images/TableTurn_Kitchen.png)

---


##url

http://http://45.55.240.99/

---

##Wireframe

![Image of ERD](images/TableTurn_Wireframe.png)

---

##ERD

![Image of ERD](images/TableTurn_ERD.jpg)

---

##Code Snippets

* This ruby method accepts an array of orders as an argument, and returns an array of arrays containing each food ordered, the quantity ordered, and the item price, to be used for generating a party receipt.  

```
def self.receipt(orders)
  foods = Food.all
  foodsHash = {}
  foods.each do |food|
    foodsHash[food.name] = [0, food.price]
  end
  foodsHash.each do |key, value|
    orders.each do |order|
      if key == order.food.name
        foodsHash[key][0]+=1
      end
    end
  end
  receipt = []
  foodsHash.each do |key, value|
    if value[0]>0
      receipt.push([key, value[0], value[1]])
    end
  end
  receipt
end
```

* This jQuery/JavaScript fragment determines the length of time since an order was placed, and changes the color of the order if certain time thresholds have been passed.

```
var d = $('.kitchen');
for (var i =0; i<d.length; i++){
  var timeDiff = (Date.parse(new Date()) - Date.parse(d[i].getAttribute("data-start-time")))/60000;
  if (timeDiff > 15) {
    d[i].style.backgroundColor =  'rgb(231, 57, 57)';
  } else if (timeDiff > 5 && timeDiff <=15) {
    d[i].style.backgroundColor =  'orange';
  }
}
```
