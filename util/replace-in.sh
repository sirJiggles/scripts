#!/bin/bash

function replaceIn {
  find $1 -type f -exec sed -i "" "s/$2/$3/g" {} \;
}
