class SharedController < ApplicationController
  skip_before_filter :authenticate
end