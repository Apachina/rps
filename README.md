# Rock Paper Scissor
Simple application rock-paper-scissors. Where users play with bot - Curb. For starting just select your bet and wait Curb's bet.

## Ruby environment

Application requires to use ruby `3.0.2`, rails `7.0.2`

### For staring:
1) run bundler to install gems
``` bundle ```
2) create .env file in folder app/, and copy information from .env.example, or set it up yourself.
``` cp .env.example .env ```
3) run create database
``` rake db:create ```
4) set seeds
``` rake db:seed ```
5) run rails server
``` rails s ```

### For tests checking just run:
``` rspec ```