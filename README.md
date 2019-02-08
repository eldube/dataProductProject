### Description
Given the choice of CHICK diet, the birth weight and age of the chicken, this application can be used to calculate the projected weight of chicken at the given age. The program uses a linear regression model built from the **ChickWeight** Dataset. This dataset is distributed with the R 3.1.2.

The application has two panels: On the left panel you need to enter/specify the inputs. These include - **choice of diet** , **the weight (in grams) of the chicken at birth**, and the **age (in days**.  The right panel shows the output - **projected weight**

###INPUTS
Enter/Specify the following inputs on the left panel.

1. **diet** - a value indicating which experimental diet the chick received.

2. **weight** - the weight (in grams)  of the chicken at birth. A reasonable weight is between 30 and 60 grams. The scroll button will increment or decrement values between 30 and 60 grams. You can enter other values through the keyboard.

3. **age** - number of days since birth. This value must be between 0 and 21. This is because the orinal data used to build the regression model was only rescricted to 21 days. After 21 days the model (and the calculations) would be unrealiable.

###SUBMIT BUTTON
After specifying the inputs, you need to click the **Submit** button to see appropriate the outputs.

###OUTPUTS
The following outputs are displayed on the right panel.

1. **Projected weight** - calculated using the linear regression model for the given diet.

2. *Diet Linear Model based on the ChickWeight dataset is also shown on the right model.*
