# Time-Chooser-XSLT
Not optimal for SEO purposes, this was for our Graduation Ceremony that would display different content Saturday morning and evening, and Sunday morning and Evening.

![image](https://user-images.githubusercontent.com/119373753/235490853-d9135231-ac4c-4317-8497-1eeaff3d1dc7.png)

For Example, this video would show Sunday morning:

![image](https://user-images.githubusercontent.com/119373753/235490980-ab1c2f59-86a6-4466-871c-f2bdc52dbc64.png)


## C# Method - Limitations Explained

This method does not work since it would require a publish for each time. The way the FGCU CMS works is that only one publish can be scheduled at a time. The C# for this could work in other instances and would perform better for SEO and for better performance.

![image](https://user-images.githubusercontent.com/119373753/235493718-f15cbbbf-2788-4786-b13a-60e22b63bfc8.png)


This works with:

<strong>displaytimecontent-csharp.xsl</strong>

&

<strong>displaytimecontent.cs</strong>

Pros:

Content only reveals one cell in the HTML

Performance is lighter

Less XSL lines

Cons:

Current time is rendered on publish

## JQuery Method - Limitations Explained


This method works for our needs, but can be bad for SEO and performance. This is a simple hide-show comparison that selects the ids if the time match and day are correct.

This works with:

<strong>displaytimecontent.xsl</strong>

&

<strong>timechooser.js</strong>

I'm calling two different for-eachs, the first one builds the html, using position() to do each id on each element.

![image](https://user-images.githubusercontent.com/119373753/235494183-d9a69637-12bb-4ed7-9109-6b33e54348a5.png)

The JS file in the resources folder, so it can be called on whenever this snippet is added.

![image](https://user-images.githubusercontent.com/119373753/235493431-eebc5598-d03a-491e-9f5f-4ab1e36b5e7b.png)

An inline script needs to be generated that talks to the timechooser global js file.

![image](https://user-images.githubusercontent.com/119373753/235494079-db771090-2a82-4d4a-8d90-87013d538481.png)

Pros:

Does not require republishing hourly

Does not use backend code, JS can be faster

Cons:

Poor HTML & SEO results (best used sparingly)

XSL is messier


