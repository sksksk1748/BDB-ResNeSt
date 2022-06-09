# Training Method
## Note :
```
If you want to test the results of each experiment in the paper, make sure to change the corresponding file name to networks.py.

For example:
~/BDB-ResNeSt/models/networks_resnest.py
                        ⇓
~/BDB-ResNeSt/models/networks.py
```

&nbsp; 
![](doc/Overall_performance.png)

- networks_resnest_linear_gb_2048_linear_fdb_2048.py		
```bash
$ sudo chmod 777 table_4_3.sh
$ ./table_4_3.sh
```

&nbsp; 

![](doc/Performance_of_the_ResNeSt_Feature_Extraction.png)
- networks_resnest.py
```python
152         # Layer 4 no downsample
153         #resnet = resnest50(pretrained=True, dilation=2)
154         
155         # Layer 4 have downsample
156         resnet = resnest50(pretrained=True)
```
```bash
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/have_downsample/bs64/market-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=market1501 --test_batch=64 --train_batch=64 --optim=adam --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/have_downsample/bs64/cuhk-label-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-label --test_batch=64 --train_batch=64 --optim=adam --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/have_downsample/bs64/cuhk-detect-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-detect --test_batch=64 --train_batch=64 --optim=adam --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/have_downsample/bs64/dukemtmc-reid-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=dukemtmc-reid --test_batch=64 --train_batch=64 --optim=adam --adjust_lr
```

&nbsp;

![](doc/The_impact_of_down-sampling_of_the_ResNeSt.png)
- networks_resnest.py 
```python
152         # Layer 4 no downsample
153         resnet = resnest50(pretrained=True, dilation=2)
154         
155         # Layer 4 have downsample
156         #resnet = resnest50(pretrained=True)
```
```bash
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.33/market-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=market1501 --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.33 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.33/cuhk-label-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-label --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.33 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.33/cuhk-detect-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-detect --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.33 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.33/dukemtmc-reid-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=dukemtmc-reid --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.33 --adjust_lr
```

&nbsp;

![](doc/The_impact_of_erased_height_ratio.png)
- networks_resnest.py 
```python
152         # Layer 4 no downsample
153         resnet = resnest50(pretrained=True, dilation=2)
```
```bash
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0/market-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=market1501 --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0/cuhk-label-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-label --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0/cuhk-detect-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-detect --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0/dukemtmc-reid-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=dukemtmc-reid --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.1/market-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=market1501 --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.1 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.1/cuhk-label-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-label --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.1 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.1/cuhk-detect-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-detect --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.1 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.1/dukemtmc-reid-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=dukemtmc-reid --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.1 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.2/market-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=market1501 --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.2 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.2/cuhk-label-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-label --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.2 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.2/cuhk-detect-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-detect --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.2 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.2/dukemtmc-reid-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=dukemtmc-reid --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.2 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.3/market-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=market1501 --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.3 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.3/cuhk-label-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-label --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.3 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.3/cuhk-detect-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-detect --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.3 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.3/dukemtmc-reid-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=dukemtmc-reid --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.3 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.33/market-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=market1501 --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.33 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.33/cuhk-label-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-label --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.33 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.33/cuhk-detect-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-detect --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.33 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.33/dukemtmc-reid-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=dukemtmc-reid --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.33 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.4/market-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=market1501 --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.4 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.4/cuhk-label-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-label --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.4 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.4/cuhk-detect-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-detect --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.4 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.4/dukemtmc-reid-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=dukemtmc-reid --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.4 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.5/market-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=market1501 --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.5 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.5/cuhk-label-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-label --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.5 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.5/cuhk-detect-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-detect --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.5 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.5/dukemtmc-reid-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=dukemtmc-reid --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.5 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.6/market-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=market1501 --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.6 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.6/cuhk-label-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-label --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.6 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.6/cuhk-detect-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-detect --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.6 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.6/dukemtmc-reid-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=dukemtmc-reid --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.6 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.7/market-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=market1501 --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.7 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.7/cuhk-label-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-label --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.7 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.7/cuhk-detect-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-detect --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.7 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.7/dukemtmc-reid-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=dukemtmc-reid --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.7 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.8/market-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=market1501 --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.8 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.8/cuhk-label-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-label --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.8 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.8/cuhk-detect-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-detect --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.8 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.8/dukemtmc-reid-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=dukemtmc-reid --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.8 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.9/market-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=market1501 --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.9 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.9/cuhk-label-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-label --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.9 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.9/cuhk-detect-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-detect --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.9 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_0.9/dukemtmc-reid-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=dukemtmc-reid --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=0.9 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_1/market-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=market1501 --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=1 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_1/cuhk-label-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-label --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=1 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_1/cuhk-detect-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=cuhk-detect --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=1 --adjust_lr
python main_reid.py train --save_dir='./pytorch-ckpt/resnest50/no_downsample_erased_height_ratio/bs64/height_ratio_1/dukemtmc-reid-bfe-adam-400' --max_epoch=400 --eval_step=30 --dataset=dukemtmc-reid --test_batch=64 --train_batch=64 --optim=adam --erased_height_ratio=1 --adjust_lr
```


&nbsp;

![](doc/The_impact_of_number_of_fully_connected_layers_in_the_feature.png)
- networks_resnest_linear_fdb_2048_gb_delete.py ( 1FC )
```bash
$ ./table_4_7_1FC.sh
```
- networks_resnest_linear_fdb_2048_1024_gb_delete.py ( 2FC )
```bash
$ ./table_4_7_2FC.sh
```
- networks_resnest_linear_fdb_2048_1024_512_gb_delete.py ( 3FC )
```bash
$ ./table_4_7_3FC.sh
```


&nbsp;

![](doc/The_impact_of_number_of_fully_connected_layers_in_the_global_branch.png)
- networks_resnest_linear_gb_2048_fdb_delete.py ( 1FC )
```bash
$ ./table_4_8_1FC.sh
```

- networks_resnest_conv_gb_2048_1024_fdb_delete.py ( 1Conv&1FC )
```bash
$ ./table_4_8_1Conv.sh
```

- networks_resnest_linear_gb_2048_1024_fdb_delete.py ( 2FC )
```bash
$ ./table_4_8_2FC.sh
```

- networks_resnest_conv_gb_2048_1024_512_fdb_delete.py ( 2Conv&1FC )
```bash
$ ./table_4_8_2Conv.sh
```

- networks_resnest_linear_gb_2048_1024_512_fdb_delete.py ( 3FC )
```bash
$ ./table_4_8_3FC.sh
```

&nbsp;

![](doc/The_impact_of_number_of_fully_connected_layers_in_the_global_branch_and_the_feature_dropping_branch.png)
- The experiment results have been run in overall performance. ( 1FC )
- networks_resnest_conv_gb_2048_1024_linear_fdb_2048_1024.py ( 1Conv&1FC/2FC )
```bash
$ ./table_4_9_1Conv.sh
```

- networks_resnest_linear_gb_2048_1024_linear_fdb_2048_1024.py ( 2FC )
```bash
$ ./table_4_9_2FC.sh
```

- networks_resnest_conv_gb_2048_1024_512_linear_fdb_2048_1024_512.py ( 2Conv&1FC/3FC )
```bash
$ ./table_4_9_2Conv.sh
```

- networks_resnest_linear_gb_2048_1024_512_linear_fdb_2048_1024_512.py ( 3FC )
```bash
$ ./table_4_9_3FC.sh
```