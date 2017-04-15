<center><h1><b>API Reference</b><h1></center>

##1. Sign-in/Sign-out/Sign-up
### Sign-in
**URL:** [api/sessions](api/sessions)

**Method: POST**

**Param request:**

  * `session[email]`, type: string, presence: true
  * `session[password]`, type: string, presence: true

**Request example:**

  * `POST: {"session": {"email": "tran.thi.hong.thuy@gmail.com", "password": "12345678"} }`

**Response:**

  * **Success**

    `{
      "user": {
        "id": 1,
        "name": "Tran Thi Hong Thuy",
        "email": "phannh@gmail.com",
        "avatar": null,
        "birthday": null,
        "phone_number": "0987654321",
        "address": null,
        "auth_token": "RzsAJXEttsAM8zvacceR"
      }
    }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "Invalid email or password" }`

    *status: 422*

--------------

#### Sign-out
**URL:** [api/sessions](api/sessions/1)

**Method: DELETE**

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)

**Request example:**

  * `DELETE: https://ecommercev1.herokuapp.com/api/sessions/1`

**Response:**

   * **Success**

    `Blank`

  * **Unsuccess**

    `{ "errors": "Invalid id of user or authorization" }`

    *status: 422*

--------------

### Sign-up
**URL:** [api/users](api/users)

**Method: POST **

**Param request:**

  * `user[name]`, type: string, presence: true, length: {maximum: 50}
  * `user[email]`, type: string, presence: true, length: {maximum: 255}
  * `user[password]`, type: string, presence: true, length: {minimum: 6}
  * `user[phone_number]`, type: string, presence: true, length: {minimum: 10, maximum: 11}
  * `user[password_confirmation]`, type: string, presence: true, length: {minimum: 6}
  * `user[avata]`, type: string

**Request example:**

  * `POST: {"user": {"name": "Tran Thi Hong Thuy", "email": "tran.thi.hong.thuy@gmail.com", "password": "12345678", "password_confirmation": "12345678", "phone_number": "0987654321"}}`

**Response:**

  * **Success**

    `{
      "user": {
        "id": 1,
        "name": "Tran Thi Hong Thuy",
        "email": "tran.thi.hong.thuy@gmail.com",
        "avatar": null,
        "birthday": null,
        "phone_number": "0987654321",
        "address": null,
        "auth_token": "RKHZwEacGvMCsftXNggN"
      }
    }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

##2. User

### Show user information

**URL:** [api/users](api/users/1)

**Method: GET **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `id`, type: integer

**Request example:**

  * `GET: https://ecommercev1.herokuapp.com/api/users/:id`

  * `GET: https://ecommercev1.herokuapp.com/api/users/1`

**Response:**

  * **Success**

    * `{
        "user": {
          "id": 1,
          "name": "Tran Thi Hong Thuy",
          "email": "tran.thi.hong.thuy@gmail.com",
          "avatar": null,
          "birthday": null,
          "phone_number": "0987654321",
          "address": null,
          "auth_token": "4b-oELaAz4KSbqG9YvJh"
        }
      }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

### Update

**URL:** [api/users](api/users/2)

**Method: PATCH **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `user[name]`, type: string, presence: true, length: {maximum: 50}
  * `user[email]`, type: string, presence: true, length: {maximum: 255}
  * `user[password]`, type: string, presence: true, length: {minimum: 6}
  * `user[password_confirmation]`, type: string, presence: true, length: {minimum: 6}
  * `user[avata]`, type: string
  * `user[phone_number]`, type: string, length: {minimun: 10, maximum: 11}
  * `user[birthday]`, type: date

**Request example:**

  * `PATCH: {"user": {"name": "Tran Thi Hong Thuy", "birthday": "27/07/1994",
    "address": "Vu Ban, Nam Dinh",
    "avatar": "/9j/4AAQSkZJRgABAgAAAQABAAD/7QCcUGhvdG9zaG9Kn/9k=..............." }}`

**Response:**

  * **Success**

    `{
      "user": {
        "id": 1,
        "name": "Tran Thi Hong Thuy",
        "email": "tran.thi.hong.thuy@gmail.com",
        "avatar": "http://res.cloudinary.com/dnvmk5bvc/image/upload/v1488215096/cvt9qrzr7twadhqmdmkp.jpg",
        "birthday": "1994-07-27",
        "phone_number": "0987654321",
        "address": "Vu Ban, Nam Dinh",
        "auth_token": "4b-oELaAz4KSbqG9YvJh"
      }
    }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

##3. Category

### Show list categories

**URL:** [api/categories](api/categories)

**Method: GET **

**Param request:**

**Request example:**

  * `GET: https://ecommercev1.herokuapp.com/api/categories`

**Response:**

  * **Success**

    *
      `{
        "categories": [
          {
            "id": 1,
            "name": "Điện thoại"
          },
          {
            "id": 2,
            "name": "Quần áo"
          }
        ]
      }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

### Create new Category

**URL:** [api/categories](api/categories)

**Method: POST **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `name`, type: string

**Request example:**

  * `POST: https://ecommercev1.herokuapp.com/api/categories`
    * `params: { "category": {"name": "Điện thoại"} }`

**Response:**

  * **Success**

    * `{
        "category": {
          "id": 1,
          "name": "Điện thoại"
        }
      }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

### Show category information

**URL:** [api/categories](api/categories/1)

**Method: GET **

**Param request:**

  * `id`, type: integer

**Request example:**

  * `GET: https://ecommercev1.herokuapp.com/api/categories/:id`

  * `GET: https://ecommercev1.herokuapp.com/api/categories/1`

**Response:**

  * **Success**

    * `{
        "category": {
          "id": 1,
          "name": "Điện thoại"
        }
      }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

### Update information category

**URL:** [api/categories](api/categories/1)

**Method: PATCH **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `id`, type: integer

**Request example:**

  * `PATCH: https://ecommercev1.herokuapp.com/api/categories/1`
  * `params: { "category": {"name": "Điện thoại 23"}`

**Response:**

  * **Success**

    * `{
        "category": {
          "id": 1,
          "name": "Điện thoại 23"
        }
      }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

### Delete category

**URL:** [api/categories](api/categories/1)

**Method: DELETE **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `id`, type: integer

**Request example:**

  * `DELETE: https://ecommercev1.herokuapp.com/api/categories/1`

**Response:**

  * **Success**

    * `{
        "success": "Category has been deleted"
      }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

##4. Product

### Lists products

**URL:** [api/products](api/products)

**Method: GET **

**Param request:**

  * `params[:search]`, type: string

**Request example:**

  * `GET: https://ecommercev1.herokuapp.com/products?search=string`

**Response:**

  * `search=`

    * `{
  "products": [
    {
      "id": 6,
      "name": "Bộ makeup",
      "price": 165000,
      "category_id": 3,
      "sales": 0,
      "image": null
    },
    {
      "id": 5,
      "name": "Nước hoa",
      "price": 165000,
      "category_id": 3,
      "sales": 0,
      "image": null
    },
    {
      "id": 4,
      "name": "Son",
      "price": 365000,
      "category_id": 3,
      "sales": 0,
      "image": null
    },
    {
      "id": 3,
      "name": "Áo khóa da",
      "price": 365000,
      "category_id": 2,
      "sales": 0,
      "image": null
    },
    {
      "id": 2,
      "name": "Áo dài Việt Nam",
      "price": 365000,
      "category_id": 2,
      "sales": 0,
      "image": null
    },
    {
      "id": 1,
      "name": "Sam Sung S7",
      "price": 1165000,
      "category_id": 1,
      "sales": 0,
      "image": null
    }
  ]
}`

  * `search=Áo`

    * `
    {
      "products": [
        {
          "id": 3,
          "name": "Áo khóa da",
          "price": 365000,
          "category_id": 2,
          "sales": 0,
          "image": null
        },
        {
          "id": 2,
          "name": "Áo dài Việt Nam",
          "price": 365000,
          "category_id": 2,
          "sales": 0,
          "image": null
        }
      ]
    }
    `
--------------

### Create new Product

**URL:** [api/products](api/categories/1/products)

**Method: POST **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `name`, type: string
  * `price`, type: float
  * `descriptions`, type: string
  * `sales`, type: float
  * `quantity`, type: integer
  * `category_id`, type: integer
  * `image for product`:
    * `name`, type: string

**Request example:**

  * `POST: https://ecommercev1.herokuapp.com/api/categories/1/products`
  * `params: { "product": { "name": "Quần jean nữ rách gối 169 (xanh đậm)", "descriptions": "Kiểu dáng cá tính năng động, thiết kế độc đáo, dễ dàng phối hợp trang phục", "price": "165000", "quantity": "20",  "category_id": "1", "image_products_attributes": {"0": { "name": "image 1"}, "1": {"name": "image2"} } } }`

**Response:**

  * **Success**

    `{
      "product": {
        "id": 1,
        "name": "Quần jean nữ rách gối 169 (xanh đậm)",
        "price": 165000,
        "quantity": 20,
        "category_id": 1,
        "sales": 0,
        "descriptions": null,
        "image_products": [
          {
            "id": 1,
            "name": "image 1",
            "photo": null
          },
          {
            "id": 2,
            "name": "image2",
            "photo": null
          }
        ]
      }
    }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------


### Show information for product

**URL:** [api/products](api/categories/1/products/1)

**Method: GET **

**Param request:**

  * `product_id`, type: integer

**Request example:**

  * `GET: https://ecommercev1.herokuapp.com/api/categories/1/products/:product_id`

  * `GET: https://ecommercev1.herokuapp.com/api/categories/1/products/1`

**Response:**

  * **Success**

    `{
      "product": {
        "id": 1,
        "name": "Quần jean nữ rách gối 169 (xanh đậm)",
        "price": 165000,
        "quantity": 20,
        "category_id": 1,
        "sales": 0,
        "descriptions": null,
        "image_products": [
          {
            "id": 1,
            "name": "image 1",
            "photo": "http://res.cloudinary.com/dnvmk5bvc/image/upload/v1488678106/fdo77mnyqcpodvwhicia.webp"
          },
          {
            "id": 2,
            "name": "image2",
            "photo": "http://res.cloudinary.com/dnvmk5bvc/image/upload/v1488678108/tojalpm5gahrbgq5ghex.jpg"
          }
        ]
      }
    }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

### Update information for product

**URL:** [api/products](api/categories/1/products/1)

**Method: PATCH **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `name`, type: string
  * `price`, type: float
  * `descriptions`, type: string
  * `sales`, type: float
  * `quantity`, type: integer
  * `category_id`, type: integer
  * `image for product`:
    * `id`, type: integer
    * `photo`, type: string

**Request example:**

  * `GET: https://ecommercev1.herokuapp.com/api/categories/1/products/1`
  * `params: {  "descriptions": "Kiểu dáng cá tính năng động, thiết kế độc đáo, dễ dàng phối hợp trang phục", "image_products_attributes": {"0": {"id": "1", "photo": "UklGRvzgBQBXRUJQVlA4IPDgBQBQ8AydASpSA1IDPgQBLwAACJZS0Df2b7AFx5E/nqn9jr37W9oHpP9F+xf99/5H+W+Sfk/rw9Efff81/jf7//2/8x/2fyC/b/+L/U/vB/n+mj3//bf9r/Z/tv/mf/v8JXN3+e/xv+b/2X+A/+f/L/9v5r/1H/L/1/+7/1/+W//v/f/DX9i/yH/M/0P+f/4H7//+H9BP5z/Tv8l/f/81/sf8D/8/+D+JP+Z/6f+J/x/+78pP8d/wP/X/sf9t/0vkT/Vv7p/rP8V/mv9z+/P/b/I//ef9L/U/6r/u/v/9ov7z/pP+R/nf9j/1P3//AP+b/0v/L/mF+/H/H/Kv/s//X/o/9z///Rd/iP+L/7f99/vP/D9Bf9B/uf+5/af/k/v//1/yX/7v/k/2v+1//X+x+07/Bf8H/wf6z/W/+7/U///8Fv6d/c/9x+zv/Z/zf/7/7/4Af/L///874vv4B/4P/57qH8A/eL8//qngS73fpP4ef2f+0/4D...."}, "1": {"id": "2", "photo": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCAMgAyADASIAAhEBAxEB/8QAHQAAAQQDAQEAAAAAAAAAAAAABAIDBQYABwgBCf/EAFMQAAEDAgMFBAcEBgYIBAYCAwIAAQMEEgURIgYTITEyB0FCUggUI1FhYnIVM3GCJIGRkqKyFkOhscHCCSU0NVNz0dImY+HiFxg2ZPDyRFR08YP/xAAcAQACAwEBAQEAAAAAAAAAAAACAwAEBQEGBwj/xABDEQACAgECBAQBCAcGBQUBAAAAAQIDEgQRBSEiMhMxQlIzBhQjQWJysfAVYXGBkbLRUVOCkqLSByRDocI0weHi8kT/2gAMAwEAAhEDEQA/AN4EPyrAHUnjF8uK8CO4S8K8uvM9g2JARyFvEp"} } } }`

**Response:**

  * **Success**

    `{
      "product": {
        "id": 1,
        "name": "Quần jean nữ rách gối 169 (xanh đậm)",
        "price": 165000,
        "quantity": 20,
        "category_id": 1,
        "sales": 0,
        "descriptions": null,
        "image_products": [
          {
            "id": 1,
            "name": "image 1",
            "photo": "http://res.cloudinary.com/dnvmk5bvc/image/upload/v1488678106/fdo77mnyqcpodvwhicia.webp"
          },
          {
            "id": 2,
            "name": "image2",
            "photo": "http://res.cloudinary.com/dnvmk5bvc/image/upload/v1488678108/tojalpm5gahrbgq5ghex.jpg"
          }
        ]
      }
    }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

##5. Order

### Create new Order

**URL:** [api/orders](api/users/1/orders)

**Method: POST **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `user_id`, type: integer
  * `product_ids_and_quantities`

**Request example:**

  * `POST: https://ecommercev1.herokuapp.com/api/categories/1/orders`
  * `params: {"order": {"user_id": "1", "product_ids_and_quantities": [ [3,5]]}}`

**Response:**

  * **Success**

    `{
      "order": {
        "id": 1,
        "total": 2500000,
        "products": [
          {
            "id": 3,
            "name": "Nước hoa Mỹ",
            "price": 500000,
            "quantity": 0,
            "category_id": 1,
            "sales": 0,
            "descriptions": "Hương thơm quyến rũ",
            "image_products": [
              {
                "id": 5,
                "name": "image 1",
                "photo": null
              },
              {
                "id": 6,
                "name": "image 2",
                "photo": null
              }
            ]
          }
        ]
      }
    }`

    *status: 200*

  * **Unsuccess**

    `{
      "errors": {
        "Nước hoa Mỹ": [
          "Is out of stock, just n left"
        ]
      }
    }`
    `n : số lượng của sản phẩm còn lại trong hệ thống`

    *status: 422*

--------------

### Show list order for user

**URL:** [api/orders](api/users/1/orders)

**Method: GET **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `user_id`, type: integer

**Request example:**

  * `GET: https://ecommercev1.herokuapp.com/api/users/1/orders`

**Response:**

  * **Success**

    `{
      "orders": [
        {
          "id": 1,
          "total": 1118000,
          "products": [
            {
              "id": 1,
              "name": "Nước hoa nam Jolie Dion Black Blue Eau de parfum 100ml ",
              "price": 259000,
              "quantity": 10,
              "category_id": 2,
              "sales": 0,
              "descriptions": "Hương thơm quyến rũ",
              "image_products": [
                {
                  "id": 1,
                  "name": "image 1",
                  "photo": null
                },
                {
                  "id": 2,
                  "name": "image 2",
                  "photo": null
                }
              ]
            },
            {
              "id": 2,
              "name": "quần jeans",
              "price": 300000,
              "quantity": 2,
              "category_id": 1,
              "sales": 0,
              "descriptions": "Hương thơm quyến rũ",
              "image_products": [
                {
                  "id": 3,
                  "name": "image 1",
                  "photo": null
                },
                {
                  "id": 4,
                  "name": "image 2",
                  "photo": null
                }
              ]
            }
          ]
        },
        {
          "id": 2,
          "total": 1118000,
          "products": [
            {
              "id": 1,
              "name": "Nước hoa nam Jolie Dion Black Blue Eau de parfum 100ml ",
              "price": 259000,
              "quantity": 10,
              "category_id": 2,
              "sales": 0,
              "descriptions": "Hương thơm quyến rũ",
              "image_products": [
                {
                  "id": 1,
                  "name": "image 1",
                  "photo": null
                },
                {
                  "id": 2,
                  "name": "image 2",
                  "photo": null
                }
              ]
            },
            {
              "id": 2,
              "name": "quần jeans",
              "price": 300000,
              "quantity": 2,
              "category_id": 1,
              "sales": 0,
              "descriptions": "Hương thơm quyến rũ",
              "image_products": [
                {
                  "id": 3,
                  "name": "image 1",
                  "photo": null
                },
                {
                  "id": 4,
                  "name": "image 2",
                  "photo": null
                }
              ]
            }
          ]
        }
      ]
    }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

### Show details information order

**URL:** [api/orders](api/users/1/orders/1)

**Method: GET **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `user_id`, type: integer
  * `order_id`, type: integer

**Request example:**

  * `GET: https://ecommercev1.herokuapp.com/api/users/1/orders/1`

**Response:**

  * **Success**

    `{
      "order": {
        "id": 1,
        "total": 2500000,
        "products": [
          {
            "id": 3,
            "name": "Nước hoa Mỹ",
            "price": 500000,
            "quantity": 0,
            "category_id": 1,
            "sales": 0,
            "descriptions": "Hương thơm quyến rũ",
            "image_products": [
              {
                "id": 5,
                "name": "image 1",
                "photo": null
              },
              {
                "id": 6,
                "name": "image 2",
                "photo": null
              }
            ]
          }
        ]
      }
    }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------
