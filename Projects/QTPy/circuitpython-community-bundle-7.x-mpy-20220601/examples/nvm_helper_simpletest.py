# SPDX-FileCopyrightText: Copyright (c) 2021 Tim Cocks for foamyguy
#
# SPDX-License-Identifier: Unlicense
import foamyguy_nvm_helper as nvm_helper

nvm_helper.save_data(
    {"name": "nvm_helper", "num": 92, "float": 3.14}, test_run=False, verbose=True
)
read_data = nvm_helper.read_data()
print("read data is:")
print(read_data)
