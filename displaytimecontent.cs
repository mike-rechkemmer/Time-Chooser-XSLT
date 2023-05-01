/* method: displayTimeContent */
/* Returns the content only if the Date and Time matches the current date and time. */
public static string displayTimeContent(string _date, string _starttime, string _endtime, string _content)
{
    string response = "";
    DateTime dt;
    DateTime currentDateTime = DateTime.Now;

    try
    {                   
        dt = Convert.ToDateTime(_date);
        if(currentDateTime.ToString("MM/dd/yyyy") == dt.ToString("MM/dd/yyyy"))
        {
            // Convert start and end time strings to DateTime objects
            DateTime startTime = Convert.ToDateTime(_starttime);
            DateTime endTime = Convert.ToDateTime(_endtime);

            // Check if the current time is between start and end time
            if (currentDateTime.TimeOfDay >= startTime.TimeOfDay && currentDateTime.TimeOfDay <= endTime.TimeOfDay)
            {
                response = _content;
                response += "<p>Start time is "+ startTime.TimeOfDay+"</p>";
                response += "<p>Current time is "+ currentDateTime.TimeOfDay+"</p>";
                response += "<p>End time is "+ endTime.TimeOfDay+"</p>";
            }
        }
    }
    catch (Exception e)
    {
        response = e.ToString();
    }

    return response;
}