# Different erased height ratio feature map
## Note :
```
If you want to use figure_4_11_noMask.sh and figure_4_11_mask.sh, 
be sure to modify the contents of networks_resnest.py according to the instructions before using it.
```
&nbsp;
![](doc/The_feature_map_of_different_erased_height_ratios.png)
- networks_resnest.py ( No mask ~ 1.0 )
    - **Uncomment line 226 or 232 before saving and executing**
```python
152         # Layer 4 no downsample
153         resnet = resnest50(pretrained=True, dilation=2)

225         # get no mask feature map (erased height ratio : 0)
226         #self.feature_map_to_png(x, 1)

231         # get mask feature map (erased height ratio : 0.1 ~ 1.0)                                                                             
232         #self.feature_map_to_png(x, 2)
```
- Uncomment line 226 & Execute the following python command
```bash
$ ./figure_4_11_noMask.sh
```
- Uncomment line 232 & Execute the following python command
```bash
$ ./figure_4_11_mask.sh
```