// Configs
S.cfga({
  "defaultToCurrentScreen" : true,
  "secondsBetweenRepeat" : 0.1,
  "checkDefaultsOnLoad" : true,
  "focusCheckWidthMax" : 3000,
  "orderScreensLeftToRight" : true,
  //"nudgePercentOf" : screenSize,
  //"resizePercentOf" : screenSize,
  "windowsHintsIgnoreHiddenWindows" : false
});

// Operations
var Full = S.op("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var leftMain = Full.dup({ "width" : "screenSizeX*2/3" });
var leftHalf = Full.dup({ "width" : "screenSizeX/2" });
var leftTop = leftHalf.dup({ "height" : "screenSizeY/2" });
var leftBottom = leftTop.dup({ "y" : "screenOriginY+screenSizeY/2" });

var rightAssist = Full.dup({ "x" : "screenOriginX+(screenSizeX*2/3)",
                             "width" : "screenSizeX/3"
});
var rightHalf = leftHalf.dup({ "x" : "screenOriginX+screenSizeX/2" });
var rightTop = rightHalf.dup({ "height" : "screenSizeY/2" });
var rightBottom = rightTop.dup({ "y" : "screenOriginY+screenSizeY/2" });

var topHalf = Full.dup({ "height" : "screenSizeY/2" });
var bottomHalf = topHalf.dup({ "y" : "screenOriginY+screenSizeY/2" });

var hyper = "ctrl,shift,alt,cmd";

var leftToogle = 0;
var rightToogle = 0;
var retileLayout = 0;

var screenRect = slate.screen().rect();

var disableLayouts = function(windowObject) {
  retileLayout = 0;
}

var retile = function(windowObject) {
  retileLayout = 1;
  var windows = [];
  slate.eachApp(function(app) {
    app.eachWindow(function(win) {
      if (win.isMinimizedOrHidden()) return;
      if (null == win.title() || win.title() === "") return;
      windows.push(win);
    });
  });

  var windowSizeX;
  var windowSizeY;
  var winPosY;

  if(typeof screenRect == 'undefined') {
    windowSizeX = 1680 * 0.4;
    windowSizeY = 1050 / (windows.length - 1);
    winPosY = 0;
  }
  else {
    windowSizeX = screenRect.width * 0.4
    windowSizeY = screenRect.height / (windows.length - 1);
    winPosY     = screenRect.y;
  }

  var count = 0;

  if(windows.length==1) {
    windows[0].doOperation(Full);
    windows[0].focus();
  }
  else {
    for (i = 0; i < windows.length; i++) {
      w = windows[i];

      if ((w.pid() == windowObject.pid()) && count == 0) {
        mainWidth = (windows.length > 1) ? "screenSizeX*0.6" : "screenSizeX";
        count++;
        w.doOperation("move", {
          "x": "screenOriginX",
          "y": "screenOriginY",
          "width": mainWidth,
          "height": "screenSizeY"
        });
        w.focus();
      }
      else {
        w.doOperation("move", {
          "x": "screenOriginX+screenSizeX*0.6",
          "y": winPosY,
          "width": windowSizeX,
          "height": windowSizeY
        });

        winPosY += windowSizeY;
      }
    }
  }
}

// Batch bind everything. Less typing.
slate.bindAll({
  // Basic Location Bindings
  ";:ctrl,shift,alt,cmd" : leftBottom,
  "':ctrl,shift,alt,cmd" : bottomHalf,
  "backslash:ctrl,shift,alt,cmd" : rightBottom,
  "p:ctrl,shift,alt,cmd" : function(win) {
    if (leftToogle == 0) {
      win.doOperation(leftHalf);
      leftToogle = 1;
      return;
    }
    else {
      win.doOperation(leftMain);
      leftToogle = 0;
      return;
    }},
  "[:ctrl,shift,alt,cmd" : Full,
  "]:ctrl,shift,alt,cmd": function(win) {
    if (rightToogle == 0) {
      win.doOperation(rightHalf);
      rightToogle = 1;
      return;
    }
    else {
      win.doOperation(rightAssist);
      rightToogle = 0;
      return;
    }},
  "0:ctrl,shift,alt,cmd": leftTop,
  "-:ctrl,shift,alt,cmd" : topHalf,
  "=:ctrl,shift,alt,cmd" : rightTop,

  // Layouts
  "1:ctrl,shift,alt,cmd" : retile,
  "9:ctrl,shift,alt,cmd" : disableLayouts,
  // Resize Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  //"right:ctrl" : S.op("resize", { "width" : "+10%", "height" : "+0" }),
  //"left:ctrl" : S.op("resize", { "width" : "-10%", "height" : "+0" }),
  //"up:ctrl" : S.op("resize", { "width" : "+0", "height" : "-10%" }),
  //"down:ctrl" : S.op("resize", { "width" : "+0", "height" : "+10%" }),
  //"right:alt" : S.op("resize", { "width" : "-10%", "height" : "+0", "anchor" : "bottom-right" }),
  //"left:alt" : S.op("resize", { "width" : "+10%", "height" : "+0", "anchor" : "bottom-right" }),
  //"up:alt" : S.op("resize", { "width" : "+0", "height" : "+10%", "anchor" : "bottom-right" }),
  //"down:alt" : S.op("resize", { "width" : "+0", "height" : "-10%", "anchor" : "bottom-right" }),
  // Nudge Bindings
  "right:ctrl,shift,alt,cmd" : S.op("nudge", { "x" : "+10%", "y" : "+0" }),
  "left:ctrl,shift,alt,cmd" : S.op("nudge", { "x" : "-10%", "y" : "+0" }),
  "up:ctrl,shift,alt,cmd" : S.op("nudge", { "x" : "+0", "y" : "-10%" }),
  "down:ctrl,shift,alt,cmd" : S.op("nudge", { "x" : "+0", "y" : "+10%" }),

  // Focus Bindings
  "l:ctrl,shift,alt,cmd" : S.op("focus", { "direction" : "right" }),
  "h:ctrl,shift,alt,cmd" : S.op("focus", { "direction" : "left" }),
  "k:ctrl,shift,alt,cmd" : S.op("focus", { "direction" : "up" }),
  "j:ctrl,shift,alt,cmd" : S.op("focus", { "direction" : "down" }),

  //"right:ctrl,shift,alt,cmd" : S.op("focus", { "direction" : "right" }),
  //"left:ctrl,shift,alt,cmd" : S.op("focus", { "direction" : "left" }),
  //"up:ctrl,shift,alt,cmd" : S.op("focus", { "direction" : "up" }),
  //"down:ctrl,shift,alt,cmd" : S.op("focus", { "direction" : "down" }),

  // Window Hints
  "space:ctrl,shift,alt,cmd" : S.op("hint"),

  // Switch currently doesn't work well so I'm commenting it out until I fix it.
  //"tab:cmd" : S.op("switch"),

  // Grid
  //"esc:ctrl" : S.op("grid")
});

slate.on("windowOpened", function(event, win) {if(retileLayout==1) retile(win); });
slate.on("windowClosed", function(event, app) {if(retileLayout==1) {
                                                var count = 0;
                                                var validWindow;
                                                app.ewindow(function(win) {
                                                  if (win.isMinimizedOrHidden()) return;
                                                  if (null == win.title() || win.title() === "") return;
                                                  count++;
                                                });
                                                if(count==0) {
                                                  slate.eapp(function(appObj) {
                                                    var winCount = 0;
                                                    appObj.ewindow(function(winObj) {
                                                      if (winObj.isMinimizedOrHidden()) return;
                                                      if (null == winObj.title() || winObj.title() === "") return;
                                                      winCount++;
                                                      validWindow = winObj;
                                                    });
                                                    if(winCount>0) {
                                                      retile(validWindow);
                                                      throw StopIteration;
                                                    }
                                                  });
                                                }
                                                else {
                                                  retile(app);
                                                }
                                              }
});
slate.on("appOpened", function(event, app) {
                                              if(retileLayout==1) {
                                                var count = 0;
                                                var validWindow;
                                                app.ewindow(function(win) {
                                                  count++;
                                                });
                                                if(count==0) {
                                                  slate.eapp(function(appObj) {
                                                    var winCount = 0;
                                                    appObj.ewindow(function(winObj) {
                                                      winCount++;
                                                      validWindow = winObj;
                                                    });
                                                    if(winCount>0) {
                                                      retile(validWindow);
                                                      throw StopIteration;
                                                    }
                                                  });
                                                }
                                                else {
                                                  retile(app);
                                                }
                                              }
});
slate.on("appClosed", function(event, app) {
                                              if(retileLayout==1) {
                                                var count = 0;
                                                var validWindow;
                                                app.ewindow(function(win) {
                                                  count++;
                                                });
                                                if(count==0) {
                                                  slate.eapp(function(appObj) {
                                                    var winCount = 0;
                                                    appObj.ewindow(function(winObj) {
                                                      winCount++;
                                                      validWindow = winObj;
                                                    });
                                                    if(winCount>0) {
                                                      retile(validWindow);
                                                      throw StopIteration;
                                                    }
                                                  });
                                                }
                                              }
});
slate.on("appHidden", function(event, app) { if(retileLayout==1) retile(win); });
slate.on("appUnhidden", function(event, app) { if(retileLayout==1) retile(win); });

// Log that we're done configuring
slate.log("[SLATE] -------------- Finished Loading Config --------------");
