All files required to ensure that when any projects are created (by self-provisioners) those projects are created to include a quota.


Step 1) configure the default project request template so it applies a label to all projects created

Step 2) modify the project.config.openshift.io/cluster so it utilizes the project request template configured at step pne (done via patch)

Step 3) configure the ns configuration so it applies the quota to all projects with label specified in step 1
