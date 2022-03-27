# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin "react", to: "https://cdn.skypack.dev/react"
pin "react-dom", to: "https://cdn.skypack.dev/react-dom"
pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin "jest", to: 'https://cdn.skypack.dev/jest';