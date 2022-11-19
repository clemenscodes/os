#!/bin/sh

cargo run &
sleep 0.3
gvncviewer ::1:5900
