DIR=$1
FOCUSED_WINDOW=$(chunkc query _focused_window)
chunkc window --warp "$DIR"
