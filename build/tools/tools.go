// Copyright 2019 The go-benjieum Authors
// This file is part of the go-benjieum library.
//
// The go-benjieum library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The go-benjieum library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the go-benjieum library. If not, see <http://www.gnu.org/licenses/>.

//go:build tools
// +build tools

package tools

import (
	// Tool imports for go:generate.
	_ "github.com/fjl/gencodec"
	_ "github.com/golang/protobuf/protoc-gen-go"
	_ "golang.org/x/tools/cmd/stringer"

	// Tool imports for mobile build.
	_ "golang.org/x/mobile/cmd/gobind"
	_ "golang.org/x/mobile/cmd/gomobile"
)
