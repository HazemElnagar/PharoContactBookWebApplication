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
					spec
					package: 'contactbook' ].
			 
			


					
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
BaselineOfContactBook >> contactbook: spec [
	spec
		package: 'ContactBook'.
]

{ #category : #accessing }
BaselineOfContactBook >> projectClass [
	^ MetacelloCypressBaselineProject
]
