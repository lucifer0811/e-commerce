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
