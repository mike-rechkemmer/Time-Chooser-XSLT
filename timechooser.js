function displayTimeContent(_date, _starttime, _endtime, _id) {
  // Get the current date and time
  var currentDate = new Date();
  var currentTime = currentDate.getTime();

  // Convert the input date, start time and end time to Date objects
  var inputDate = new Date(_date);
  var startTime = new Date(_date + " " + _starttime);
  var endTime = new Date(_date + " " + _endtime);

  // Check if the current date matches the input date, and the current time is between start time and end time
  if (inputDate.toDateString() === currentDate.toDateString() && startTime.getTime() <= currentTime && endTime.getTime() >= currentTime) {
    // Show the content
    $(_id).show();

    // Log success message with current date, time and input parameters (in military time format)
    console.log("Content displayed successfully at " + currentDate.toLocaleTimeString('en-US', {hour12: false}) + " for input date " + inputDate.toLocaleDateString() + " between " + _starttime + " and " + _endtime);
  }
  else {
    // Hide the content
    $(_id).hide();

    // Log failure message with current date, time and input parameters (in military time format)
    console.log("Content not displayed at " + currentDate.toLocaleTimeString('en-US', {hour12: false}) + " for input date " + inputDate.toLocaleDateString() + " between " + _starttime + " and " + _endtime);
  }
}