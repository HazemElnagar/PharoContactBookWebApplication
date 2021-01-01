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
			seaside3: spec;
		  	bootstrap: spec;
			contactbook: spec  ].
	
	spec for: #'common' do: [	
		self 
		
			seaside3: spec;
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

{ #category : #'private - subspecs' }
BaselineOfContactBook >> seaside3: spec [
	spec
		baseline: 'Seaside3'
		with: [ spec
				loads: #('default' 'REST');
				repository: 'github://SeasideSt/Seaside:master/repository' ]
]
