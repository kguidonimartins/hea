```python
from sklearn import linear_model, datasets
import matplotlib.pyplot as plt


X, y, coef = datasets.make_regression(
    n_samples=1000, 
    n_features=1, 
    n_informative=1, 
    noise=10, 
    coef=True, 
    random_state=42
    )


plt.scatter(X, y)
```


