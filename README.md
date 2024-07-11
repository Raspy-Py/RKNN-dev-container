# Container for RKNN compilation

## Specs
 - **Base:** Ubuntu20.04
 - **Python:** 3.9
 - **RKNNToolkit:** 1.6.0

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


 
