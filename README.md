# The UbiquiBot

Ubiquity DAO's GitHub Bot to automate DevPool management.

## Quickstart

Clone the repository, install dependencies, and start the bot:

```sh
git clone https://github.com/ubiquity/ubiquibot.git
cd ubiquibot
yarn
yarn build
yarn start:watch
```

## Environment Variables

1. Copy `.env.example` to `.env`.
2. Update `.env` with your Supabase project URL and API key.
3. Add other optional variables as needed.

**Note:** Please do not rename the `.env.example` file to `.env`.

## Overview

This bot is designed to exist as a GitHub Action. Dependencies must be included and committed in the repository.

## How to use

1. Go to the [UbiquiBot App Marketplace](https://github.com/marketplace/ubiquibot).
2. Choose a plan and install UbiquiBot on your repository.
3. Congratulations! You can now use the UbiquiBot to manage your bounties.

To test the bot, create a new issue, add labels, and the bot will respond.

## Configuration

- Configure various settings in the `.env` file.

## How to run locally

1. Set up your Supabase project and Memzo organization.
2. Update `.env` with necessary keys.
3. Install dependencies and start the bot.

## How it works

Bounty bot is built using the [probot](https://probot.github.io/) framework. It can be used as a GitHub app.

## Architecture Overview

Bounty bot architecture overview.

## Supabase Cron Job (`logs-cleaner`)

Set up the `logs-cleaner` job in your Supabase project to clean up logs.
