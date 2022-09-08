# drone-npm-auth

[![Build Status](https://travis-ci.org/robertstettner/drone-npm-auth.svg?branch=master)](https://travis-ci.org/robertstettner/drone-npm-auth)

Drone plugin for authenticating into NPM to install private dependencies.

## Configuration

The following parameters are used to configure the plugin:

- `token`: The NPM token. Required (when not using credentials).
- `username`: The NPM username. Required (when using credentials).
- `password`: The NPM password. Required (when using credentials).
- `email`: The NPM email. Required (when using credentials).
- `registry`: The NPM registry. Defaults to the default NPM registry.
- `scope`: Scope of the NPM authentication. Optional.
- `path`: Output path of the generated `.npmrc` file. Defaults to `./`.

### Drone configuration example

#### Using credentials

```yaml
steps:
  - name: npm_auth
    image: robertstettner/drone-npm-auth
    settings:
      username: joebloggs
      password: mypass
      email: jb@me.com

  - name: build
    image: node:8
    commands:
      - npm install
      - npm test
    when:
      event:
        - push
        - pull_request
```

#### Using token

```yaml
steps:
  - name: npm_auth
    image: robertstettner/drone-npm-auth
    settings:
      token: a12445e4424c121323a

  - name: build
    image: node:8
    commands:
      - npm install
      - npm test
    when:
      event:
        - push
        - pull_request
```

### Drone configuration example < v1.0

#### Using credentials

```yaml
pipeline:
  npm_auth:
    image: robertstettner/drone-npm-auth
    username: joebloggs
    password: mypass
    email: jb@me.com

  build:
    image: node:8
    commands:
      - npm install
      - npm test
    when:
      event: [push, pull_request]
```

#### Using token

```yaml
pipeline:
  npm_auth:
    image: robertstettner/drone-npm-auth
    token: a12445e4424c121323a

  build:
    image: node:8
    commands:
      - npm install
      - npm test
    when:
      event: [push, pull_request]
```

## License

MIT
