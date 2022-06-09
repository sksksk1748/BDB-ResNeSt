#!/bin/bash  

all_path=(
"./networks_resnest_conv_gb_2048_1024_512_fdb_delete.py"
"./networks_resnest_conv_gb_2048_1024_512_linear_fdb_2048_1024_512.py"
"./networks_resnest_conv_gb_2048_1024_512_linear_fdb_2048_1024.py"
"./networks_resnest_conv_gb_2048_1024_fdb_delete.py"
"./networks_resnest_conv_gb_2048_1024_linear_fdb_2048_1024.py"
"./networks_resnest_conv_gb_2048_512_fdb_delete.py"
"./networks_resnest_conv_gb_2048_512_linear_fdb_2048_1024_512.py"
"./networks_resnest_conv_gb_2048_512_linear_fdb_2048_512.py"
"./networks_resnest_conv_gb_2048_512_linear_fdb_2048.py"
"./networks_resnest_conv_linear_gb_2048_1024_512_linear_fdb_2048_1024_512.py"
"./networks_resnest_conv_linear_gb_2048_1024_512_linear_fdb_2048_1024.py"
"./networks_resnest_conv_linear_linear_gb_2048_1024_512_linear_fdb_2048_1024_512.py"
"./networks_resnest_conv_linear_linear_gb_2048_1024_512_linear_fdb_2048_1024.py"
"./networks_resnest_linear_fdb_2048_1024_512_gb_delete.py"
"./networks_resnest_linear_fdb_2048_1024_gb_delete.py"
"./networks_resnest_linear_fdb_2048_512_gb_delete.py"
"./networks_resnest_linear_fdb_2048_gb_delete.py"
"./networks_resnest_linear_gb_2048_1024_512_fdb_delete.py"
"./networks_resnest_linear_gb_2048_1024_512_linear_fdb_2048_1024_512.py"
"./networks_resnest_linear_gb_2048_1024_fdb_delete.py"
"./networks_resnest_linear_gb_2048_1024_linear_fdb_2048_1024.py"
"./networks_resnest_linear_gb_2048_512_fdb_delete.py"
"./networks_resnest_linear_gb_2048_512_linear_fdb_2048_512.py"
"./networks_resnest_linear_gb_2048_fdb_delete.py"
"./networks_resnest_linear_gb_2048_linear_fdb_2048.py"
"./networks_resnest.py"
"./networks_resnet.py"
"./networks_resnext.py"
"./resnet.py"
"./__init__.py"
"./__pycache__"
)

# rename
cd models

FILE=./networks_resnest.py 
FILE_2=./networks.py

# If a disconnection occurs
if [ -f "$FILE" ] && [ -f "$FILE_2" ]; then
  TARGET="./*"
  data=()
  idx=0

  # store all the files in the current directory in the data array
  for each_file in "$search_dir"$TARGET
  do
      if [[ "${all_path[@]}" =~ "$each_file" ]]; then
        data[idx]="$each_file"
        idx=$((idx+1))
      fi

  done
 
  echo "Currently networks.py is not executed by $0 ,but by "
 
  # Find the value that is not in the array 
  diff(){
  awk 'BEGIN{RS=ORS=" "}
       {NR==FNR?a[$0]++:a[$0]--}
       END{for(k in a)if(a[k])print k}' <(echo -n "${!1}") <(echo -n "${!2}")
  }

  Array3=($(diff all_path[@] data[@]))
  echo $(grep -I -rnw '../' -e "FILE=${Array3[@]}" | grep -v grep | awk -F':' '{print $1}')
  echo "If you want to run $0 right now, there are 2 ways to handle it."
  echo -n "1. switch to the models directory and run"
  echo -e " \033[41;36m mv networks.py ${Array3[@]}\033[0m. Then you can run $0 !!"
  echo -n "2. switch to the BDB-ResNeSt directory and finish running " 
  echo -n $(grep -I -rnw '../' -e "FILE=${Array3[@]}" | grep -v grep | awk -F':' '{print $1}')
  echo " , then run $0"
  

  exit 1
# Execute under normal conditions
elif [ -f "$FILE" ] && [ ! -f "$FILE_2" ]; then
  echo "$FILE exists"
  mv $FILE networks.py
  cd ..

  # Program Execution
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

  # rename
  cd models
  mv networks.py $FILE
  cd ..
# If you encounter Ctrl + C 
elif [ ! -f "$FILE" ] && [ -f "$FILE_2" ]; then
  echo "Continue the procedure"

  cd ..
  
  # Program Execution
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

  # rename
  cd models
  mv networks.py $FILE
  cd ..
fi
