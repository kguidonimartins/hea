```python
from sklearn import linear_model, datasets
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt
import statsmodels.api as sm
import statsmodels.formula.api as smf
import numpy as np
import pandas as pd

X, y, coef = datasets.make_regression(
    n_samples=1000, 
    n_features=1, 
    n_informative=1, 
    noise=10, 
    coef=True, 
    random_state=42
    )


plt.scatter(X, y)


# Using sklearn
model = LinearRegression()

results_lm_sklearn = model.fit(X, y)

print(f"Model intercept: {results_lm_sklearn.intercept_}")
print(f"Model slope: {results_lm_sklearn.coef_}")

# Using statsmodels
df = pd.DataFrame(
    data={
        'y': y.flat,
        'X': X.flat
    }
)

results_lm_sm = smf.ols('y ~ X', data=df).fit()

print(results_lm_sm.summary())
```


