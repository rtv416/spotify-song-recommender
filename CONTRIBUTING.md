# Contributing to Spotify Song Recommender

## Branching Strategy

- **main**: The production-ready branch. Code here should be stable and ready for deployment.
- **develop**: The integration branch for features. All completed features should be merged here before moving to `main`.

### Branch Types

1. **Feature Branches**
   - **Purpose**: Develop new features.
   - **Naming Convention**: `feature/<feature-name>`
   - **Workflow**:
     1. Create from `develop`
     2. Implement feature and commit changes
     3. Push to remote repository
     4. Open a pull request to merge into `develop`
     5. Merge pull request after review and delete the feature branch

2. **Release Branches**
   - **Purpose**: Prepare a new production release.
   - **Naming Convention**: `release/<release-version>`
   - **Workflow**:
     1. Create from `develop`
     2. Perform final testing and fixes
     3. Push to remote repository
     4. Open pull requests to merge into `main` and `develop`
     5. Merge pull requests after review and delete the release branch

3. **Hotfix Branches**
   - **Purpose**: Quickly fix critical issues in the production code.
   - **Naming Convention**: `hotfix/<hotfix-name>`
   - **Workflow**:
     1. Create from `main`
     2. Implement the fix and commit changes
     3. Push to remote repository
     4. Open pull requests to merge into `main` and `develop`
     5. Merge pull requests after review and delete the hotfix branch
