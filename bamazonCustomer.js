const mysql = require("mysql");
const inquirer = require("inquirer");

const connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "bobb7426",
    database: "bamazon_DB"
});

connection.connect(function (err) {
    if (err) {
        console.log("oh no");
        throw err;
    }

    console.log("you are connected");
    readProducts();
    
});


function readProducts() {
    console.log("--------------------------------------");
    console.log("-------------PRODUCT LIST:------------");
    console.log("--------------------------------------")
    connection.query("select * from products", function(err, res){
        if (err) throw err; 
        for(i = 0; i < res.length; i++) {
			console.log('Item ID: ' + res[i].position + '\n Product Name: ' + res[i].PRODUCT_NAME + '\n Price: ' + '$' + res[i].PRICE + '\n (Quantity left: ' + res[i].STOCK_QUANTITY + ') \n --------------------------')
        }
        buyProduct();
    })
}

function buyProduct() {

    inquirer
        .prompt([
        {
            message: "what product would you like to buy?",
            name: "selectItem",
        },  

        {   
            message: "how many would you like to buy?",
            name: "selectQty",
        }
        ])
        .then (function(answers) {
            console.log(answers.selectItem);
            console.log(answers.selectQty);
            var purchased = answers.selectQty;
            var id = answers.selectItem;
            
            connection.query("select * from products where position =" + answers.selectItem, function(err, res){
                console.log(res[0]);
                var total = purchased * res[0].PRICE;
                if(purchased > res[0].STOCK_QUANTITY){
                    console.log("We dont have enough of those to fill your order")
                } else {
                    connection.query("UPDATE products SET ? WHERE ?",
                        [
                            {
                                STOCK_QUANTITY: res[0].STOCK_QUANTITY - purchased
                            },
                            {
                                position: id
                            }
                        ],
                        function(err, result){
                            if (err){
                                console.log("you need to learn to write working code");
                                return;
                            }
                        console.log("your total is : $" + total);
                        }
                    )   
                }
                connection.end();
            })
        });
};