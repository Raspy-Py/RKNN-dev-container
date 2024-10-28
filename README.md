# Container for RKNN compilation

## Specs
 - **Base:** Ubuntu20.04
 - **Python:** 3.6
 - **RKNNToolkit:** 1.7.0

## Prerequisites

 - [`Docker`](https://docs.docker.com/engine/install/)
 - `Make`

## Usage

1. **Build image**
```bash
make build
```

2. **Launch container**
```bash
make start
```

3. **Do your stuff inside `/app/shared/`**
```bash
./compile_yolo_and_stuff.sh
```

4. **Remove container**
```bash
make stop
```

## Guide

Explicitly specify Python's version:
```bash
python3.6 convert_troch.py
```

To export a PyTorch model to `.pt` file:
```python
model.eval()
trace_model = torch.jit.trace(model, torch.Tensor(B, C, H, W))  # (1, 3, 192, 256)
trace_model.save("model.pt")
```

To convert it to RKNN use `shared/convert_torch.py` script. But set your configs there. For example:
```python3
# Configs
model_pt = '/app/shared/small_unfold_op13_256x192.pt'
model_rknn = './small_unfold_op13_256x192.rknn'
dataset = './data/data.txt'
platform = 'rv1126'
input_size_list = [[3, 192, 256]] # [C, H, W]
```





 
