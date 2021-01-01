Class {
	#name : #BaselineOfContactBook,
	#superclass : #BaselineOf,
	#category : #BaselineOfContactBook
}

{ #category : #'private - subspecs' }
BaselineOfContactBook >> baseline: spec [
	<baseline>
			spec
			for: #common
			do: [
					self 
						  bootstrap: spec.
				spec	package:'ContactBook' with: [ spec requires: #('Bootstrap') ] 
					].
				
				
			 
			


					
]

{ #category : #'private - subspecs' }
BaselineOfContactBook >> bootstrap: spec [
	spec
		configuration: 'Bootstrap'
		with: [ 
			spec
  repository: 'github://astares/Seaside-Bootstrap:master/src';
  version: #stable
	 ]	
]

{ #category : #'private - subspecs' }
BaselineOfContactBook >> seaside3: spec [
	spec
		baseline: 'Seaside3'
		with: [ spec
				loads: #('default' 'REST');
				repository: 'github://SeasideSt/Seaside:master/repository' ]
]
