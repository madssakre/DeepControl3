# Clipped DeepControl

**Version 3.0** · 18-11-2022 · Mads Sloth Vinding

MATLAB code accompanying the paper:

> Vinding MS, Lund TE. **Clipped DeepControl: Deep neural network two-dimensional pulse design with an amplitude constraint layer.** *Artificial Intelligence in Medicine* 135 (2023) 102460. https://doi.org/10.1016/j.artmed.2022.102460

The repository contains the network definition and training setup, plus the custom amplitude-clipping layer (`clipLayer`) that limits the network's output to a fixed range.

> **Note:** This code documents the method used in the paper. It is not a turnkey package: no training data is included, so `train.m` will not run as-is.

## Contents

| File | Description |
|---|---|
| `train.m` | Network architecture (CNN with swish activations, a fully connected layer and a clipping layer) and training options |
| `tools/clipLayer.m` | Custom layer that clips its input to `[-Ceiling, Ceiling]` |
| `tools/clipLayerForward.m` | Forward pass: `Z = min(max(-ceiling, X), ceiling)` |
| `tools/clipLayerBackward.m` | Backward pass: passes the gradient through inside the range and sets it to zero outside |
| `tools/clipLayerHostStrategy.m` | Execution strategy that connects the forward and backward functions |

## Requirements

- MATLAB R2021a or later (`swishLayer` was introduced in R2021a)
- Deep Learning Toolbox
- Parallel Computing Toolbox and a supported NVIDIA GPU, since training uses `'ExecutionEnvironment','gpu'`. Set it to `'cpu'` or `'auto'` otherwise.

`clipLayer` builds on internal, undocumented Deep Learning Toolbox classes (`nnet.internal.cnn.layer.*`). These can change between MATLAB releases, so the layer may need adapting for releases other than the one used for the paper.

## Usage

1. Replace the placeholder variables at the top of `train.m` with your own data:
   - `trainInput`, `validateInput`: input images of size 64 × 64 × 3 × *N*
   - `trainTarget`, `validateTarget`: regression targets with 1400 values per sample (*N* × 1400)
2. Run `train.m` from the repository root. It adds `tools/` to the MATLAB path.

## Citation

If you use this code, please cite the paper above:

```bibtex
@article{Vinding2023ClippedDeepControl,
  author  = {Vinding, Mads Sloth and Lund, Torben Ellegaard},
  title   = {Clipped {DeepControl}: Deep neural network two-dimensional pulse design with an amplitude constraint layer},
  journal = {Artificial Intelligence in Medicine},
  volume  = {135},
  pages   = {102460},
  year    = {2023},
  doi     = {10.1016/j.artmed.2022.102460}
}
```

## License

Copyright (C) 2022 Mads Sloth Vinding

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the [LICENSE](LICENSE) file for details.
