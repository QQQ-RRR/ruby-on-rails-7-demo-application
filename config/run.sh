#!/bin/bash
bundle exec rake db:setup db:migrate
puma