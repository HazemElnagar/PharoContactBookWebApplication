Class {
	#name : #WAPharoFileLibraryTest,
	#superclass : #WAContextTest,
	#category : #'Seaside-Tests-Pharo-Core'
}

{ #category : #private }
WAPharoFileLibraryTest >> supportsSwitchToNewCompiler [
	Smalltalk at: #PragmaSetting ifAbsent: [ ^ true ].
	^ false
]

{ #category : #tests }
WAPharoFileLibraryTest >> testAddAllFilesIn [
	| workingDirectory directory library |
	workingDirectory := FileSystem disk workingDirectory.
	workingDirectory = FileSystem root ifTrue: [
		"on Pharo 7+ #workingDirectory answers the root if the vm was stared by double clicking or drag and drop"
		workingDirectory := FileLocator imageDirectory ].
	directory := workingDirectory / 'XXXUsedBySeasideTests'.
	GRPlatform current ensureExistenceOfFolder: directory pathString.
	[ [
		(directory / '.Seaside_Store') ensureCreateFile .
		(directory / 'foo') ensureCreateFile.
		GRPlatform current doSilently: [
			library := WAFileLibrary
				subclass: #XXXTestFileLibrary
				instanceVariableNames: ''
				classVariableNames: ''
				poolDictionaries: ''
				category: 'Uncategorized'.
		[ library addAllFilesIn: directory fullName.
			self assert: library selectors size = 1 ] "reject .Seaside_Store"
				ensure: [ library removeFromSystem ] ] ]
			ensure: [ directory children do: [ :each | each delete ] ] ]
			ensure: [ directory delete ]
]

{ #category : #tests }
WAPharoFileLibraryTest >> testCompileByteArrayLiteralSource [
	| library data file source expected |
	GRPharoPlatform current useByteArrayLiterals ifFalse: [ ^ self ].
	self 
		useCompileUseNewCompiler: true
		during: [
			self assert: GRPharoPlatform current useByteArrayLiterals.
			library := WATestingFiles default.
			data := (1 to: 255) asByteArray.
			file := WAFile new
				contentType: WAMimeType imageJpeg;
				contents: data;
				fileName: 'demo.jpeg';
				yourself.
			library addFile: file.
			
			[ source := WATestingFiles sourceCodeAt: #demoJpeg.
			expected := 'demoJpeg
	^ #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255]'.
			self assert: source greaseString = expected ]
				ensure: [ library removeFile: file fileName ] ]
]

{ #category : #tests }
WAPharoFileLibraryTest >> testCompileByteArrayWithCacheSource [
	| library data file source expected |
	self 
		useCompileUseNewCompiler: false
		during: [
			self deny: GRPharoPlatform current useByteArrayLiterals.
			library := WATestingFiles default.
			data := (1 to: 255) asByteArray.
			file := WAFile new
				contentType: WAMimeType imageJpeg;
				contents: data;
				fileName: 'demo.jpeg';
				yourself.
			library addFile: file.
			
			[ source := WATestingFiles sourceCodeAt: #demoJpeg.
			expected := 'demoJpeg
	^ #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255) asByteArray'.
			self assert: source greaseString = expected ]
				ensure: [ library removeFile: file fileName ] ]
]

{ #category : #private }
WAPharoFileLibraryTest >> useCompileUseNewCompiler: aBoolean during: aBlock [
	| oldValue |
	self supportsSwitchToNewCompiler
		ifFalse: [ ^ self ].
	oldValue := GRPharoPlatform current useByteArrayLiterals.
	[ (Smalltalk at: #Preferences) setPreference: #compileUseNewCompiler toValue: aBoolean.
	aBlock value ]
		ensure: [
			GRPharoPlatform current useByteArrayLiterals ifTrue: [
				(Smalltalk at: #Preferences) setPreference: #compileUseNewCompiler toValue: oldValue ] ]
]