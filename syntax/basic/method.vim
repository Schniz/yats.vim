syntax region  typescriptMethodDef  start=/\v(set|get)\_s+[a-zA-Z_$]\k*\_s*(\(|\<)/ end=/\ze{/
  \ contains=typescriptMethodAccessor,typescriptMethodName
  \ containedin=typescriptClassBlock,typescriptObjectLiteral
  \ nextgroup=typescriptBlock
  \ skipwhite contained

syntax region  typescriptMethodDef  start=/\v[a-zA-Z_$]\k*\_s*(\(|\<)/ end=/\ze{/
  \ contains=typescriptMethodName,typescriptConstructor
  \ containedin=typescriptClassBlock,typescriptObjectLiteral
  \ nextgroup=typescriptBlock
  \ skipwhite contained

syntax keyword typescriptMethodAccessor        contained get set
syntax keyword typescriptConstructor           contained constructor
  \ nextgroup=typescriptMethodArgs
  \ skipwhite skipempty

syntax match   typescriptMethodName            contained /[a-zA-Z_$]\k*/
  \ nextgroup=typescriptMethodArgs
  \ containedin=typescriptMethodDef
  \ skipwhite skipempty
syntax region  typescriptMethodName            matchgroup=typescriptPropertyName
  \ start=/\[/ end=/]/
  \ contains=@typescriptValue
  \ nextgroup=typescriptMethodArgs
  \ skipwhite skipempty contained

syntax region  typescriptMethodArgs            contained start=/(\|</ end=/\%(:\s*\)\@<!{/me=e-1
  \ contains=@typescriptCallSignature
  \ skipwhite
