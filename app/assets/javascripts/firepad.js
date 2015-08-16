$(document).ready(function(){
  console.log("hi");

  //initialize firebase with given pad_id or generates new one
  if (pad_id){
    var firepadRef = new Firebase("https://studybuddydbc.firebaseio.com/firepads/" + pad_id);
  } else {
    var pad_id = Math.floor(Math.random() * 9999999999).toString()
    var firepadRef = new Firebase("https://studybuddydbc.firebaseio.com/firepads/" + pad_id);
  }

  //create codemirror with linewrapping
  var codeMirror = CodeMirror(document.getElementById('firepad'), { lineWrapping: true });

  //will need to replace this with the student ids.
  //this gets given to firepad & firepad userlist to show users working on a doc
   var userId = Math.floor(Math.random() * 9999999999).toString();

  //create firepad with richtext and userid
  var firepad = Firepad.fromCodeMirror(firepadRef, codeMirror,
      { richTextToolbar: true, richTextShortcuts: true, userId: userId});

  //// Create FirepadUserList (with our desired userId).
  var firepadUserList = FirepadUserList.fromDiv(firepadRef.child('users'),
      document.getElementById('userlist'), userId);

  //initialize contents with whatever teacher or students have written here previously
  firepad.on('ready', function() {
    // Firepad is ready.
    //pull assignment from DB
    if (firepad.isHistoryEmpty()) {
      firepad.setText('Check out the user list to the left!');
    }

  });
  //change so that different users get different colors
  firepad.setUserColor("#0000FF");

  //save work as changes happen
  firepad.on('synced', function(isSynced) {
  //synced', is fired when your local client edits the document and when those edits have been successfully written to Firebase.
  // isSynced will be false immediately after the user edits the pad,
  // and true when their edit has been saved to Firebase.

  //save to DB
  console.log('synced');
});
})