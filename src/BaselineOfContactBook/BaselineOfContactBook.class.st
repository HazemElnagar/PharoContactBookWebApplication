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
					self bootstrap:  spec.
					
					].
				
				
			 
			


					
]

{ #category : #'private - subspecs' }
BaselineOfContactBook >> bootstrap: spec [
	spec
		baseline: 'Bootstrap'
		with: [ 
			spec
				repository: 'github.com/astares/Seaside-Bootstrap:master/src' ]	
]

{ #category : #'private - subspecs' }
BaselineOfContactBook >> seaside3: spec [
	spec
		baseline: 'Seaside3'
		with: [ spec
				loads: #('default' 'REST');
				repository: 'github://SeasideSt/Seaside:master/repository' ]
]
