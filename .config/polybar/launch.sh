# polybar-msg cmd quit
killall -q polybar

polybar -r top 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bar launched..."
