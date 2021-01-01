Class {
	#name : #BaselineOfContactBook,
	#superclass : #BaselineOf,
	#category : #BaselineOfContactBook
}

{ #category : #'private - subspecs' }
BaselineOfContactBook >> baseline: spec [
	<baseline>
	
	spec for: #'pharo6.x' do: [	
		spec preLoadDoIt: #preLoad61.
		self 
		  	bootstrap: spec;
			contactbook: spec  ].
	
	spec for: #'common' do: [	
		self 
			
		  	bootstrap: spec;
			contactbook: spec ]
]

{ #category : #'private - subspecs' }
BaselineOfContactBook >> bootstrap: spec [
	spec
		baseline: 'Bootstrap'
		with: [ spec
				loads: #('default' 'REST');
				repository: 'github.com/astares/Seaside-Bootstrap:master/repository' ]
]

{ #category : #'private - subspecs' }
BaselineOfContactBook >> contactbook: spec [ 

	spec 
			package: 'ContactBook' with: [
				spec requires: #('Bootstrap' ). ]
]

{ #category : #'private - subspecs' }
BaselineOfContactBook >> preLoad61 [

	Iceberg enableMetacelloIntegration: true.
	IceMetacelloPharoPlatform select.
]
