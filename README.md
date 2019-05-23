[![Build Status](https://travis-ci.org/susanwere/Graph-ql.svg?branch=develop)](https://travis-ci.org/susanwere/Graph-ql)  [![Maintainability](https://api.codeclimate.com/v1/badges/8708143e263b045f53dc/maintainability)](https://codeclimate.com/github/susanwere/Graph-ql/maintainability)  [![Test Coverage](https://api.codeclimate.com/v1/badges/8708143e263b045f53dc/test_coverage)](https://codeclimate.com/github/susanwere/Graph-ql/test_coverage)

# Graph-ql

This application contains code which is a practice of the graphql-ruby tutorial on how to build your very own GraphQL server using Ruby on Rails.

Get started [here](https://www.howtographql.com/graphql-ruby/0-introduction/)

Things covered from the tutorial and included in this application include

* Defining a GraphQL schema
* Connecting types
* Manipulating data via GraphQL mutation
* Handling complex querying

Topics covered from the tutorial and not included in this application include

* Filtering
* Pagination

# Installation

Install dependencies:

`bundle install`
`rails db:create`
`rails db:migrate`
  
Starting the server:

`rails server`

Running GraphQL IDE:

` \open http://localhost:3000/graphiql `

# Sample GraphQL Queries as per the tutorial

List links:

```

{
  allLinks() {
    id
    url
    description
    createdAt
    postedBy {
      id
      name
    }
  }
}

```

Create new user:

```

mutation {
  createUser(
    name: "Radoslav Stankov",
    authProvider: {
      email: { email: "rado@example.com", password: "123456" }
    }
  ) {
    id
    email
    name
  }
}

```

Login User:

```

mutation {
  signinUser(email: {email: "rado@example.com", password: "123456"}) {
    token
    user {
      id
      email
      name
    }
  }
}

```

Create new link:

```

mutation {
  createLink(url:"http://example.com", description:"Example") {
    id
    url
    description
    postedBy {
      id
      name
    }
  }
}

```

Create new vote:

```

mutation {
  createVote(linkId:"TGluay0yMQ==") {
    user {
      id
      name
    }
    link {
      id
      url
      description
    }
  }
}

```
