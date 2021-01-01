Class {
	#name : #BaselineOfContactBook,
	#superclass : #BaselineOf,
	#category : #BaselineOfContactBook
}

{ #category : #'private - subspecs' }
BaselineOfContactBook >> baseline: spec [
	<baseline>
			
	spec for: #'common' do: [	
		self bootstrap: spec.
		
		spec  
		package:	'ContactBook' with: [ spec requires: #('Bootstrap') ]		
						 ]
]

{ #category : #'private - subspecs' }
BaselineOfContactBook >> bootstrap: spec [
	spec
		baseline: 'Bootstrap'
		with: [ spec
				loads: #('default' 'REST');
				repository: 'github.com/astares/Seaside-Bootstrap:master/src' ]	
]

{ #category : #accessing }
BaselineOfContactBook >> projectClass [
	^ MetacelloCypressBaselineProject
]
