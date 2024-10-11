# MCLX Casino Backend

Casino App to play games, save highscores and to add new games. Project: MCLX Casino.

## Description

This repository is the backend of our MCLX Casino project. <br />
The code is build for a AWS infrastructure and works fine so far. <br />
<br />
Note that, if you want the full experience you will need the frontend for this project!

## Getting Started

### Dependencies

- Node.js
- MySQL (Backend)
- Express (Backend)

### Installing

- [How/where to download your program](https://github.com/SachsAlex/casino-backend.git)

```
git clone https://github.com/SachsAlex/casino-backend.git
```

```
npm install
```

### Executing program

- How to run the program

```
npm run dev
```

### .env

- the .env file will not be uploaded
- .env needs to be created on the AWS EC2 of the backend

```
ssh -i <key.pem> ubuntu@<public-ip_backend-ec2>
sudo nano .env
```


- the following criteria are needed:

```
PORT=<connection between frontend and backend>
DB_NAME=<for mysql connection>
DB_USERNAME=<saved in AWS Parameter Store>
DB_PASSWORD=<saved in AWS Parameter Store>
DB_HOST=<endpoint of RDS database>
NODE_ENV=dev
JWT_SECRET=<your own secret>
```

## Authors

Contributors names and contact info

Alexander Sachs  
[LinkedIn](https://www.linkedin.com/in/alexander-sachs-01a917308)

Michail Rigas
[LinkedIn](https://www.linkedin.com/in/michail-rigas-08b17445)

Carsten Jahn
[LinkedIn](https://www.linkedin.com/in/carsten-jahn-056764105/)

## License

This project is licensed under the [MIT] License - see the LICENSE.md file for details
