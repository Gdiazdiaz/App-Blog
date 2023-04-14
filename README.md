<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Blog-App <a name="about-project"></a>

** BlogApp ** Is a Ruby on Rails is project that will allow the user to have an account, post a blog, comment and like.

## 🛠 Built With <a name="built-with"></a>


  <ul>
    <li><a href="https://www.ruby-lang.org/en/documentation/">Ruby</a></li>
  </ul>

  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **Back-End Ruby on Rails operations**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get the content of this project locally you need to run the following commands in your terminal:

and follow these steps.

### Prerequisites

- IDE(code editor) like: **Vscode**, **Sublime**, etc.
- [Git](https://www.linode.com/docs/guides/how-to-install-git-on-linux-mac-and-windows/)

### Setup

Clone this repository to your desired folder:

1. Download the **Zip** file or clone the repo with:
 ```bash
git clone git@github.com:Gdiazdiaz/App-Blog.git
```
2. To access cloned directory run:
```bash
cd curriculum 
```

### Install

> To install linters and other project's dependencies run:

```bash
 bundle install
```

### Usage

To run the project, execute the following command:
1. setup the database:
```
rails db:setup
```
2. run the rails server:
```
rails s
```

For the API
To get the users on the browser
http://127.0.0.1:3000/users
To get a specific user
http://127.0.0.1:3000/users/:user_id
To get the posts for a user
http://127.0.0.1:3000/users/:user_id/posts
To get a specific post
http://127.0.0.1:3000/users/:user_id/posts/:post_id
To get the comments of a post
http://127.0.0.1:3000/users/:user_id/posts/:post_id/comments
To post a comment send a POST request with the format
{
  "author_id": user_id, Note: :user_id must be the id of the user who creates the comment.
  "text": "your comment"
 }

### Run tests

```
rspec spec
```

For tracking linter errors in Ruby files run:
 
 ```
   rubocop . 
 ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Glenda Diaz**

- GitHub: [@gjuliao](https://github.com/Gdiazdiaz)
- LinkedIn: [Glenda Diaz](www.linkedin.com/in/glendadiazz)

👤 **Shahadat Hossain**

[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://github.com/shahadat3669) [![linkedin](https://img.shields.io/badge/shahadat3669-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/shahadat3669) [![twitter](https://img.shields.io/badge/@shahadat3669-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/shahadat3669)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **[likes-will-be-unique]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Gdiazdiaz/App-Blog/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project please give it a star.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank the Microverse team, all micronauts and my coding-partners for the support.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>