DIR=$1
FOCUSED_WINDOW=$(kwmc query window focused id)
NEW_WINDOW=$(kwmc query window focused "$DIR")
SAME_PARENT=$(kwmc query window parent "$FOCUSED_WINDOW" "$NEW_WINDOW")
if [ "$SAME_PARENT" = "true" ]
then
    kwmc window -s "$DIR"
else
    kwmc window -m "$DIR"
    kwmc window -f $FOCUSED_WINDOW
fi
